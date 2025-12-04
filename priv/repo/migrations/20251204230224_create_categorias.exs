defmodule MicroErp.Repo.Migrations.CreateCategorias do
  use Ecto.Migration

  def change do
    create table(:categorias) do
      add :nome, :string
      add :descricao, :string

      timestamps(type: :utc_datetime)
    end
  end
end
