defmodule MicroErp.Produtos do
  @moduledoc """
  The Produtos context.
  """

  import Ecto.Query, warn: false
  alias MicroErp.Repo

  alias MicroErp.Produtos.Produto

  @doc """
  Returns the list of produtos.

  ## Examples

      iex> list_produtos()
      [%Produto{}, ...]

  """
  # SELECT p0."id", p0."nome", p0."sku", p0."preco", p0."saldo_atual", p0."inserted_at", p0."updated_at" FROM "produtos" AS p0 []
  def list_produtos do
    Repo.all(Produto)
  end

  @doc """
  Gets a single produto.

  Raises `Ecto.NoResultsError` if the Produto does not exist.

  ## Examples

      iex> get_produto!(123)
      %Produto{}

      iex> get_produto!(456)
      ** (Ecto.NoResultsError)

  """
  # SELECT p0."id", p0."nome", p0."sku", p0."preco", p0."saldo_atual", p0."inserted_at", p0."updated_at" FROM "produtos" AS p0 WHERE (p0."id" = ?) [6]
  def get_produto!(id), do: Repo.get!(Produto, id)

  @doc """
  Creates a produto.

  ## Examples

      iex> create_produto(%{field: value})
      {:ok, %Produto{}}

      iex> create_produto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # INSERT INTO "produtos" ("nome","preco","saldo_atual","sku","inserted_at","updated_at") VALUES (?1,?2,?3,?4,?5,?6) RETURNING "id" ["Papel Higineico", Decimal.new("10.99"), 20, "E9DjKJSr8t25k", ~U[2025-12-05 01:11:25Z], ~U[2025-12-05 01:11:25Z]]
  def create_produto(attrs \\ %{}) do
    %Produto{}
    |> Produto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a produto.

  ## Examples

      iex> update_produto(produto, %{field: new_value})
      {:ok, %Produto{}}

      iex> update_produto(produto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # UPDATE "produtos" SET "nome" = ?, "updated_at" = ? WHERE "id" = ? ["Papel Higineico Super Forte", ~U[2025-12-05 01:11:54Z], 6]
  def update_produto(%Produto{} = produto, attrs) do
    produto
    |> Produto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a produto.

  ## Examples

      iex> delete_produto(produto)
      {:ok, %Produto{}}

      iex> delete_produto(produto)
      {:error, %Ecto.Changeset{}}

  """
  # DELETE FROM "produtos" WHERE "id" = ? [6]
  def delete_produto(%Produto{} = produto) do
    produto
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.foreign_key_constraint(:movimentacoes,
      name: "movimentacoes_produto_id_fkey",
      message: "Não é possível excluir este produto pois ele possui movimentações registradas."
    )
    |> Repo.delete()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking produto changes.

  ## Examples

      iex> change_produto(produto)
      %Ecto.Changeset{data: %Produto{}}

  """
  def change_produto(%Produto{} = produto, attrs \\ %{}) do
    Produto.changeset(produto, attrs)
  end
end
