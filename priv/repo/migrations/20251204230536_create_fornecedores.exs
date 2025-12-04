defmodule MicroErp.Repo.Migrations.CreateFornecedores do
  use Ecto.Migration

  def change do
    create table(:fornecedores) do
      add :nome, :string
      add :cnpj, :string
      add :contato, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:fornecedores, [:cnpj])
  end
end
