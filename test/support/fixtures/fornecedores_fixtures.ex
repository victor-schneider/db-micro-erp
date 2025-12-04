defmodule MicroErp.FornecedoresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MicroErp.Fornecedores` context.
  """

  @doc """
  Generate a unique fornecedor cnpj.
  """
  def unique_fornecedor_cnpj, do: "some cnpj#{System.unique_integer([:positive])}"

  @doc """
  Generate a fornecedor.
  """
  def fornecedor_fixture(attrs \\ %{}) do
    {:ok, fornecedor} =
      attrs
      |> Enum.into(%{
        cnpj: unique_fornecedor_cnpj(),
        contato: "some contato",
        nome: "some nome"
      })
      |> MicroErp.Fornecedores.create_fornecedor()

    fornecedor
  end
end
