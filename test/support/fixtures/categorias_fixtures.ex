defmodule MicroErp.CategoriasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MicroErp.Categorias` context.
  """

  @doc """
  Generate a categoria.
  """
  def categoria_fixture(attrs \\ %{}) do
    {:ok, categoria} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        nome: "some nome"
      })
      |> MicroErp.Categorias.create_categoria()

    categoria
  end
end
