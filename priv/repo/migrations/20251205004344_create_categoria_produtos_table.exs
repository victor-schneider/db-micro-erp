defmodule MicroErp.Repo.Migrations.CreateCategoriaProdutosTable do
  use Ecto.Migration

  def change do
    create table(:categoria_produtos) do
      add :categoria_id, references(:categorias, on_delete: :nothing)
      add :produto_id, references(:produtos, on_delete: :nothing)
      timestamps(type: :utc_datetime)
    end
  end
end
