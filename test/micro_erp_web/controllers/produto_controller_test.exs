defmodule MicroErpWeb.ProdutoControllerTest do
  use MicroErpWeb.ConnCase

  import MicroErp.ProdutosFixtures

  alias MicroErp.Produtos.Produto

  @create_attrs %{
    nome: "some nome",
    sku: "some sku",
    preco: "120.5",
    saldo_atual: 42
  }
  @update_attrs %{
    nome: "some updated nome",
    sku: "some updated sku",
    preco: "456.7",
    saldo_atual: 43
  }
  @invalid_attrs %{nome: nil, sku: nil, preco: nil, saldo_atual: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all produtos", %{conn: conn} do
      conn = get(conn, ~p"/api/produtos")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create produto" do
    test "renders produto when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/produtos", produto: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/produtos/#{id}")

      assert %{
               "id" => ^id,
               "nome" => "some nome",
               "preco" => "120.5",
               "saldo_atual" => 42,
               "sku" => "some sku"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/produtos", produto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update produto" do
    setup [:create_produto]

    test "renders produto when data is valid", %{conn: conn, produto: %Produto{id: id} = produto} do
      conn = put(conn, ~p"/api/produtos/#{produto}", produto: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/produtos/#{id}")

      assert %{
               "id" => ^id,
               "nome" => "some updated nome",
               "preco" => "456.7",
               "saldo_atual" => 43,
               "sku" => "some updated sku"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, produto: produto} do
      conn = put(conn, ~p"/api/produtos/#{produto}", produto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete produto" do
    setup [:create_produto]

    test "deletes chosen produto", %{conn: conn, produto: produto} do
      conn = delete(conn, ~p"/api/produtos/#{produto}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/produtos/#{produto}")
      end
    end
  end

  defp create_produto(_) do
    produto = produto_fixture()
    %{produto: produto}
  end
end
