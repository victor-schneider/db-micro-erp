defmodule MicroErpWeb.ProdutoJSON do
  alias MicroErp.Produtos.Produto

  @doc """
  Renders a list of produtos.
  """
  def index(%{produtos: produtos}) do
    %{data: for(produto <- produtos, do: data(produto))}
  end

  @doc """
  Renders a single produto.
  """
  def show(%{produto: produto}) do
    %{data: data(produto)}
  end

  defp data(%Produto{} = produto) do
    %{
      id: produto.id,
      nome: produto.nome,
      sku: produto.sku,
      preco: produto.preco,
      saldo_atual: produto.saldo_atual
    }
  end
end
