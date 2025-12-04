defmodule MicroErpWeb.ProdutoController do
  use MicroErpWeb, :controller

  alias MicroErp.Produtos
  alias MicroErp.Produtos.Produto

  action_fallback MicroErpWeb.FallbackController

  def index(conn, _params) do
    produtos = Produtos.list_produtos()
    render(conn, :index, produtos: produtos)
  end

  def create(conn, %{"produto" => produto_params}) do
    with {:ok, %Produto{} = produto} <- Produtos.create_produto(produto_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/produtos/#{produto}")
      |> render(:show, produto: produto)
    end
  end

  def show(conn, %{"id" => id}) do
    produto = Produtos.get_produto!(id)
    render(conn, :show, produto: produto)
  end

  def update(conn, %{"id" => id, "produto" => produto_params}) do
    produto = Produtos.get_produto!(id)

    with {:ok, %Produto{} = produto} <- Produtos.update_produto(produto, produto_params) do
      render(conn, :show, produto: produto)
    end
  end

  def delete(conn, %{"id" => id}) do
    produto = Produtos.get_produto!(id)

    with {:ok, %Produto{}} <- Produtos.delete_produto(produto) do
      send_resp(conn, :no_content, "")
    end
  end
end
