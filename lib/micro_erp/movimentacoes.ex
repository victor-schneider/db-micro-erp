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
  def get_movimentacao!(id), do: Repo.get!(Movimentacao, id)

  @doc """
  Creates a movimentacao.

  ## Examples

      iex> create_movimentacao(%{field: value})
      {:ok, %Movimentacao{}}

      iex> create_movimentacao(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
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
