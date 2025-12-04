defmodule MicroErpWeb.MovimentacaoControllerTest do
  use MicroErpWeb.ConnCase

  import MicroErp.MovimentacoesFixtures

  alias MicroErp.Movimentacoes.Movimentacao

  @create_attrs %{
    references: "some references",
    tipo: :ENTRADA,
    quantidade: 42,
    data_hora: ~N[2025-12-03 23:17:00],
    observacao: "some observacao"
  }
  @update_attrs %{
    references: "some updated references",
    tipo: :SAIDA,
    quantidade: 43,
    data_hora: ~N[2025-12-04 23:17:00],
    observacao: "some updated observacao"
  }
  @invalid_attrs %{references: nil, tipo: nil, quantidade: nil, data_hora: nil, observacao: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all movimentacoes", %{conn: conn} do
      conn = get(conn, ~p"/api/movimentacoes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create movimentacao" do
    test "renders movimentacao when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/movimentacoes", movimentacao: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/movimentacoes/#{id}")

      assert %{
               "id" => ^id,
               "data_hora" => "2025-12-03T23:17:00",
               "observacao" => "some observacao",
               "quantidade" => 42,
               "references" => "some references",
               "tipo" => "ENTRADA"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/movimentacoes", movimentacao: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update movimentacao" do
    setup [:create_movimentacao]

    test "renders movimentacao when data is valid", %{conn: conn, movimentacao: %Movimentacao{id: id} = movimentacao} do
      conn = put(conn, ~p"/api/movimentacoes/#{movimentacao}", movimentacao: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/movimentacoes/#{id}")

      assert %{
               "id" => ^id,
               "data_hora" => "2025-12-04T23:17:00",
               "observacao" => "some updated observacao",
               "quantidade" => 43,
               "references" => "some updated references",
               "tipo" => "SAIDA"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, movimentacao: movimentacao} do
      conn = put(conn, ~p"/api/movimentacoes/#{movimentacao}", movimentacao: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete movimentacao" do
    setup [:create_movimentacao]

    test "deletes chosen movimentacao", %{conn: conn, movimentacao: movimentacao} do
      conn = delete(conn, ~p"/api/movimentacoes/#{movimentacao}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/movimentacoes/#{movimentacao}")
      end
    end
  end

  defp create_movimentacao(_) do
    movimentacao = movimentacao_fixture()
    %{movimentacao: movimentacao}
  end
end
