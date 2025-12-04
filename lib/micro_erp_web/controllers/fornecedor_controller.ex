defmodule MicroErpWeb.FornecedorController do
  use MicroErpWeb, :controller

  alias MicroErp.Fornecedores
  alias MicroErp.Fornecedores.Fornecedor

  action_fallback MicroErpWeb.FallbackController

  def index(conn, _params) do
    fornecedores = Fornecedores.list_fornecedores()
    render(conn, :index, fornecedores: fornecedores)
  end

  def create(conn, %{"fornecedor" => fornecedor_params}) do
    with {:ok, %Fornecedor{} = fornecedor} <- Fornecedores.create_fornecedor(fornecedor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/fornecedores/#{fornecedor}")
      |> render(:show, fornecedor: fornecedor)
    end
  end

  def show(conn, %{"id" => id}) do
    fornecedor = Fornecedores.get_fornecedor!(id)
    render(conn, :show, fornecedor: fornecedor)
  end

  def update(conn, %{"id" => id, "fornecedor" => fornecedor_params}) do
    fornecedor = Fornecedores.get_fornecedor!(id)

    with {:ok, %Fornecedor{} = fornecedor} <- Fornecedores.update_fornecedor(fornecedor, fornecedor_params) do
      render(conn, :show, fornecedor: fornecedor)
    end
  end

  def delete(conn, %{"id" => id}) do
    fornecedor = Fornecedores.get_fornecedor!(id)

    with {:ok, %Fornecedor{}} <- Fornecedores.delete_fornecedor(fornecedor) do
      send_resp(conn, :no_content, "")
    end
  end
end
