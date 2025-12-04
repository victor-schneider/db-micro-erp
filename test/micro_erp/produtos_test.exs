defmodule MicroErp.ProdutosTest do
  use MicroErp.DataCase

  alias MicroErp.Produtos

  describe "produtos" do
    alias MicroErp.Produtos.Produto

    import MicroErp.ProdutosFixtures

    @invalid_attrs %{nome: nil, sku: nil, preco: nil, saldo_atual: nil}

    test "list_produtos/0 returns all produtos" do
      produto = produto_fixture()
      assert Produtos.list_produtos() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Produtos.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      valid_attrs = %{nome: "some nome", sku: "some sku", preco: "120.5", saldo_atual: 42}

      assert {:ok, %Produto{} = produto} = Produtos.create_produto(valid_attrs)
      assert produto.nome == "some nome"
      assert produto.sku == "some sku"
      assert produto.preco == Decimal.new("120.5")
      assert produto.saldo_atual == 42
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Produtos.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      update_attrs = %{nome: "some updated nome", sku: "some updated sku", preco: "456.7", saldo_atual: 43}

      assert {:ok, %Produto{} = produto} = Produtos.update_produto(produto, update_attrs)
      assert produto.nome == "some updated nome"
      assert produto.sku == "some updated sku"
      assert produto.preco == Decimal.new("456.7")
      assert produto.saldo_atual == 43
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Produtos.update_produto(produto, @invalid_attrs)
      assert produto == Produtos.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Produtos.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Produtos.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Produtos.change_produto(produto)
    end
  end
end
