defmodule MicroErp.Categorias do
  @moduledoc """
  The Categorias context.
  """

  import Ecto.Query, warn: false
  alias MicroErp.Repo

  alias MicroErp.Categorias.Categoria

  @doc """
  Returns the list of categorias.

  ## Examples

      iex> list_categorias()
      [%Categoria{}, ...]

  """
  # SELECT c0."id", c0."nome", c0."descricao", c0."inserted_at", c0."updated_at" FROM "categorias" AS c0 []
  def list_categorias do
    Repo.all(Categoria)
  end

  @doc """
  Gets a single categoria.

  Raises `Ecto.NoResultsError` if the Categoria does not exist.

  ## Examples

      iex> get_categoria!(123)
      %Categoria{}

      iex> get_categoria!(456)
      ** (Ecto.NoResultsError)

  """
  # SELECT c0."id", c0."nome", c0."descricao", c0."inserted_at", c0."updated_at" FROM "categorias" AS c0 WHERE (c0."id" = ?) [1]
  def get_categoria!(id), do: Repo.get!(Categoria, id)

  @doc """
  Creates a categoria.

  ## Examples

      iex> create_categoria(%{field: value})
      {:ok, %Categoria{}}

      iex> create_categoria(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # INSERT INTO "categorias" ("nome","descricao","inserted_at","updated_at") VALUES (?1,?2,?3,?4) RETURNING "id" ["Limpeza", "Produtos para limpeza", ~U[2025-12-05 00:10:10Z], ~U[2025-12-05 00:10:10Z]]
  def create_categoria(attrs \\ %{}) do
    %Categoria{}
    |> Categoria.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a categoria.

  ## Examples

      iex> update_categoria(categoria, %{field: new_value})
      {:ok, %Categoria{}}

      iex> update_categoria(categoria, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # UPDATE "categorias" SET "descricao" = ?, "updated_at" = ? WHERE "id" = ? ["Produtos para limpeza para banheiros", ~U[2025-12-05 00:14:20Z], 1]
  def update_categoria(%Categoria{} = categoria, attrs) do
    categoria
    |> Categoria.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a categoria.

  ## Examples

      iex> delete_categoria(categoria)
      {:ok, %Categoria{}}

      iex> delete_categoria(categoria)
      {:error, %Ecto.Changeset{}}

  """
  # DELETE FROM "categorias" WHERE "id" = ? [2]
  def delete_categoria(%Categoria{} = categoria) do
    categoria
    |> Repo.delete()
  end

  def change_categoria(%Categoria{} = categoria, attrs \\ %{}) do
    Categoria.changeset(categoria, attrs)
  end
end
