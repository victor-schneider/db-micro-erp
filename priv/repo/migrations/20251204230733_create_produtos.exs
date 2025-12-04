defmodule MicroErp.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :nome, :string
      add :sku, :string
      add :preco, :decimal
      add :saldo_atual, :integer

      add :categoria_id, references(:categorias, on_delete: :nothing)
      add :fornecedor_id, references(:fornecedores, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:produtos, [:sku])
  end
end
