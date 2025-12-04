defmodule MicroErp.Repo.Migrations.CreateMovimentacoes do
  use Ecto.Migration

  def change do
    create table(:movimentacoes) do
      add :tipo, :string
      add :quantidade, :integer
      add :data_hora, :naive_datetime
      add :observacao, :string

      add :produto_id, references(:produtos, on_delete: :nothing)
      timestamps(type: :utc_datetime)
    end
  end
end
