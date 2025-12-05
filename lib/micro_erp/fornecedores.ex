defmodule MicroErp.Fornecedores do
  @moduledoc """
  The Fornecedores context.
  """

  import Ecto.Query, warn: false
  alias MicroErp.Repo

  alias MicroErp.Fornecedores.Fornecedor

  @doc """
  Returns the list of fornecedores.

  ## Examples

      iex> list_fornecedores()
      [%Fornecedor{}, ...]

  """
  # SELECT f0."id", f0."nome", f0."cnpj", f0."contato", f0."inserted_at", f0."updated_at" FROM "fornecedores" AS f0 []
  def list_fornecedores do
    Repo.all(Fornecedor)
  end

  @doc """
  Gets a single fornecedor.

  Raises `Ecto.NoResultsError` if the Fornecedor does not exist.

  ## Examples

      iex> get_fornecedor!(123)
      %Fornecedor{}

      iex> get_fornecedor!(456)
      ** (Ecto.NoResultsError)

  """
  # SELECT f0."id", f0."nome", f0."cnpj", f0."contato", f0."inserted_at", f0."updated_at" FROM "fornecedores" AS f0 WHERE (f0."id" = ?) [3]
  def get_fornecedor!(id), do: Repo.get!(Fornecedor, id)

  @doc """
  Creates a fornecedor.

  ## Examples

      iex> create_fornecedor(%{field: value})
      {:ok, %Fornecedor{}}

      iex> create_fornecedor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # INSERT INTO "fornecedores" ("nome","cnpj","contato","inserted_at","updated_at") VALUES (?1,?2,?3,?4,?5) RETURNING "id" ["Roberto Industrias", "13.504.731/0001-16", "contato@robertoindustrias.com.br", ~U[2025-12-05 01:06:32Z], ~U[2025-12-05 01:06:32Z]]
  def create_fornecedor(attrs \\ %{}) do
    %Fornecedor{}
    |> Fornecedor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fornecedor.

  ## Examples

      iex> update_fornecedor(fornecedor, %{field: new_value})
      {:ok, %Fornecedor{}}

      iex> update_fornecedor(fornecedor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # UPDATE "fornecedores" SET "nome" = ?, "updated_at" = ? WHERE "id" = ? ["Roberto Industrias LTDA", ~U[2025-12-05 01:07:22Z], 3]
  def update_fornecedor(%Fornecedor{} = fornecedor, attrs) do
    fornecedor
    |> Fornecedor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fornecedor.

  ## Examples

      iex> delete_fornecedor(fornecedor)
      {:ok, %Fornecedor{}}

      iex> delete_fornecedor(fornecedor)
      {:error, %Ecto.Changeset{}}

  """
  # DELETE FROM "fornecedores" WHERE "id" = ? [3]
  def delete_fornecedor(%Fornecedor{} = fornecedor) do
    Repo.delete(fornecedor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fornecedor changes.

  ## Examples

      iex> change_fornecedor(fornecedor)
      %Ecto.Changeset{data: %Fornecedor{}}

  """
  def change_fornecedor(%Fornecedor{} = fornecedor, attrs \\ %{}) do
    Fornecedor.changeset(fornecedor, attrs)
  end
end
