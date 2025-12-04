defmodule MicroErp.ProdutosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MicroErp.Produtos` context.
  """

  @doc """
  Generate a unique produto sku.
  """
  def unique_produto_sku, do: "some sku#{System.unique_integer([:positive])}"

  @doc """
  Generate a produto.
  """
  def produto_fixture(attrs \\ %{}) do
    {:ok, produto} =
      attrs
      |> Enum.into(%{
        nome: "some nome",
        preco: "120.5",
        saldo_atual: 42,
        sku: unique_produto_sku()
      })
      |> MicroErp.Produtos.create_produto()

    produto
  end
end
