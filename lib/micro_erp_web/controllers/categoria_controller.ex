defmodule MicroErpWeb.CategoriaController do
  use MicroErpWeb, :controller

  alias MicroErp.Categorias
  alias MicroErp.Categorias.Categoria

  action_fallback MicroErpWeb.FallbackController

  def index(conn, _params) do
    categorias = Categorias.list_categorias()
    render(conn, :index, categorias: categorias)
  end

  def create(conn, %{"categoria" => categoria_params}) do
    with {:ok, %Categoria{} = categoria} <- Categorias.create_categoria(categoria_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/categorias/#{categoria}")
      |> render(:show, categoria: categoria)
    end
  end

  def show(conn, %{"id" => id}) do
    categoria = Categorias.get_categoria!(id)
    render(conn, :show, categoria: categoria)
  end

  def update(conn, %{"id" => id, "categoria" => categoria_params}) do
    categoria = Categorias.get_categoria!(id)

    with {:ok, %Categoria{} = categoria} <- Categorias.update_categoria(categoria, categoria_params) do
      render(conn, :show, categoria: categoria)
    end
  end

  def delete(conn, %{"id" => id}) do
    categoria = Categorias.get_categoria!(id)

    with {:ok, %Categoria{}} <- Categorias.delete_categoria(categoria) do
      send_resp(conn, :no_content, "")
    end
  end
end
