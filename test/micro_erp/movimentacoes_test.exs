defmodule MicroErp.MovimentacoesTest do
  use MicroErp.DataCase

  alias MicroErp.Movimentacoes

  describe "movimentacoes" do
    alias MicroErp.Movimentacoes.Movimentacao

    import MicroErp.MovimentacoesFixtures

    @invalid_attrs %{references: nil, tipo: nil, quantidade: nil, data_hora: nil, observacao: nil}

    test "list_movimentacoes/0 returns all movimentacoes" do
      movimentacao = movimentacao_fixture()
      assert Movimentacoes.list_movimentacoes() == [movimentacao]
    end

    test "get_movimentacao!/1 returns the movimentacao with given id" do
      movimentacao = movimentacao_fixture()
      assert Movimentacoes.get_movimentacao!(movimentacao.id) == movimentacao
    end

    test "create_movimentacao/1 with valid data creates a movimentacao" do
      valid_attrs = %{references: "some references", tipo: :ENTRADA, quantidade: 42, data_hora: ~N[2025-12-03 23:17:00], observacao: "some observacao"}

      assert {:ok, %Movimentacao{} = movimentacao} = Movimentacoes.create_movimentacao(valid_attrs)
      assert movimentacao.references == "some references"
      assert movimentacao.tipo == :ENTRADA
      assert movimentacao.quantidade == 42
      assert movimentacao.data_hora == ~N[2025-12-03 23:17:00]
      assert movimentacao.observacao == "some observacao"
    end

    test "create_movimentacao/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movimentacoes.create_movimentacao(@invalid_attrs)
    end

    test "update_movimentacao/2 with valid data updates the movimentacao" do
      movimentacao = movimentacao_fixture()
      update_attrs = %{references: "some updated references", tipo: :SAIDA, quantidade: 43, data_hora: ~N[2025-12-04 23:17:00], observacao: "some updated observacao"}

      assert {:ok, %Movimentacao{} = movimentacao} = Movimentacoes.update_movimentacao(movimentacao, update_attrs)
      assert movimentacao.references == "some updated references"
      assert movimentacao.tipo == :SAIDA
      assert movimentacao.quantidade == 43
      assert movimentacao.data_hora == ~N[2025-12-04 23:17:00]
      assert movimentacao.observacao == "some updated observacao"
    end

    test "update_movimentacao/2 with invalid data returns error changeset" do
      movimentacao = movimentacao_fixture()
      assert {:error, %Ecto.Changeset{}} = Movimentacoes.update_movimentacao(movimentacao, @invalid_attrs)
      assert movimentacao == Movimentacoes.get_movimentacao!(movimentacao.id)
    end

    test "delete_movimentacao/1 deletes the movimentacao" do
      movimentacao = movimentacao_fixture()
      assert {:ok, %Movimentacao{}} = Movimentacoes.delete_movimentacao(movimentacao)
      assert_raise Ecto.NoResultsError, fn -> Movimentacoes.get_movimentacao!(movimentacao.id) end
    end

    test "change_movimentacao/1 returns a movimentacao changeset" do
      movimentacao = movimentacao_fixture()
      assert %Ecto.Changeset{} = Movimentacoes.change_movimentacao(movimentacao)
    end
  end
end
