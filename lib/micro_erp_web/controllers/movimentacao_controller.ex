defmodule MicroErpWeb.MovimentacaoController do
  use MicroErpWeb, :controller

  alias MicroErp.Movimentacoes
  alias MicroErp.Movimentacoes.Movimentacao

  action_fallback MicroErpWeb.FallbackController

  def index(conn, _params) do
    movimentacoes = Movimentacoes.list_movimentacoes()
    render(conn, :index, movimentacoes: movimentacoes)
  end

  def create(conn, %{"movimentacao" => movimentacao_params}) do
    with {:ok, %Movimentacao{} = movimentacao} <- Movimentacoes.create_movimentacao(movimentacao_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/movimentacoes/#{movimentacao}")
      |> render(:show, movimentacao: movimentacao)
    end
  end

  def show(conn, %{"id" => id}) do
    movimentacao = Movimentacoes.get_movimentacao!(id)
    render(conn, :show, movimentacao: movimentacao)
  end

  def update(conn, %{"id" => id, "movimentacao" => movimentacao_params}) do
    movimentacao = Movimentacoes.get_movimentacao!(id)

    with {:ok, %Movimentacao{} = movimentacao} <- Movimentacoes.update_movimentacao(movimentacao, movimentacao_params) do
      render(conn, :show, movimentacao: movimentacao)
    end
  end

  def delete(conn, %{"id" => id}) do
    movimentacao = Movimentacoes.get_movimentacao!(id)

    with {:ok, %Movimentacao{}} <- Movimentacoes.delete_movimentacao(movimentacao) do
      send_resp(conn, :no_content, "")
    end
  end
end
