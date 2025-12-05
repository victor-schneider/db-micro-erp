defmodule MicroErp.Movimentacoes do
  @moduledoc """
  The Movimentacoes context.
  """

  import Ecto.Query, warn: false
  alias MicroErp.Repo

  alias MicroErp.Movimentacoes.Movimentacao

  @doc """
  Returns the list of movimentacoes.

  ## Examples

      iex> list_movimentacoes()
      [%Movimentacao{}, ...]

  """
  # SELECT m0."id", m0."tipo", m0."quantidade", m0."data_hora", m0."observacao", m0."produto_id", m0."inserted_at", m0."updated_at" FROM "movimentacoes" AS m0 []
  def list_movimentacoes do
    Repo.all(Movimentacao)
  end

  @doc """
  Gets a single movimentacao.

  Raises `Ecto.NoResultsError` if the Movimentacao does not exist.

  ## Examples

      iex> get_movimentacao!(123)
      %Movimentacao{}

      iex> get_movimentacao!(456)
      ** (Ecto.NoResultsError)

  """
  # SELECT m0."id", m0."tipo", m0."quantidade", m0."data_hora", m0."observacao", m0."produto_id", m0."inserted_at", m0."updated_at" FROM "movimentacoes" AS m0 WHERE (m0."id" = ?) [3]
  def get_movimentacao!(id), do: Repo.get!(Movimentacao, id)

  @doc """
  Creates a movimentacao.

  ## Examples

      iex> create_movimentacao(%{field: value})
      {:ok, %Movimentacao{}}

      iex> create_movimentacao(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # INSERT INTO "movimentacoes" ("produto_id","data_hora","observacao","quantidade","tipo","inserted_at","updated_at") VALUES (?1,?2,?3,?4,?5,?6,?7) RETURNING "id" [5, ~N[2024-12-04 14:30:00], "Reposição de estoque mensal", 50, :ENTRADA, ~U[2025-12-05 01:08:57Z], ~U[2025-12-05 01:08:57Z]]
  def create_movimentacao(attrs \\ %{}) do
    %Movimentacao{}
    |> Movimentacao.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a movimentacao.

  ## Examples

      iex> update_movimentacao(movimentacao, %{field: new_value})
      {:ok, %Movimentacao{}}

      iex> update_movimentacao(movimentacao, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # UPDATE "movimentacoes" SET "tipo" = ?, "updated_at" = ? WHERE "id" = ? [:SAIDA, ~U[2025-12-05 01:09:34Z], 3]
  def update_movimentacao(%Movimentacao{} = movimentacao, attrs) do
    movimentacao
    |> Movimentacao.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a movimentacao.

  ## Examples

      iex> delete_movimentacao(movimentacao)
      {:ok, %Movimentacao{}}

      iex> delete_movimentacao(movimentacao)
      {:error, %Ecto.Changeset{}}

  """
  # DELETE FROM "movimentacoes" WHERE "id" = ? [3]
  def delete_movimentacao(%Movimentacao{} = movimentacao) do
    Repo.delete(movimentacao)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking movimentacao changes.

  ## Examples

      iex> change_movimentacao(movimentacao)
      %Ecto.Changeset{data: %Movimentacao{}}

  """
  def change_movimentacao(%Movimentacao{} = movimentacao, attrs \\ %{}) do
    Movimentacao.changeset(movimentacao, attrs)
  end
end
