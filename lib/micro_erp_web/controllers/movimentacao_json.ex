defmodule MicroErpWeb.MovimentacaoJSON do
  alias MicroErp.Movimentacoes.Movimentacao

  @doc """
  Renders a list of movimentacoes.
  """
  def index(%{movimentacoes: movimentacoes}) do
    %{data: for(movimentacao <- movimentacoes, do: data(movimentacao))}
  end

  @doc """
  Renders a single movimentacao.
  """
  def show(%{movimentacao: movimentacao}) do
    %{data: data(movimentacao)}
  end

  defp data(%Movimentacao{} = movimentacao) do
    %{
      id: movimentacao.id,
      tipo: movimentacao.tipo,
      quantidade: movimentacao.quantidade,
      data_hora: movimentacao.data_hora,
      observacao: movimentacao.observacao
    }
  end
end
