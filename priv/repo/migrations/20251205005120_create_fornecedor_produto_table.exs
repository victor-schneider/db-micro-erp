defmodule MicroErp.Repo.Migrations.CreateFornecedorProdutoTable do
  use Ecto.Migration

  def change do
    create table(:fornecedor_produtos) do
      add :fornecedor_id, references(:fornecedor, on_delete: :nothing)
      add :produto_id, references(:produtos, on_delete: :nothing)
      timestamps(type: :utc_datetime)
    end
  end
end
