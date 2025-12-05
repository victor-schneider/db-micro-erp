defmodule MicroErp.Movimentacoes.Movimentacao do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movimentacoes" do
    field :tipo, Ecto.Enum, values: [:ENTRADA, :SAIDA]
    field :quantidade, :integer
    field :data_hora, :naive_datetime
    field :observacao, :string

    belongs_to :produto, MicroErp.Produtos.Produto

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(movimentacao, attrs) do
    movimentacao
    |> cast(attrs, [:tipo, :quantidade, :data_hora, :observacao, :produto_id])
    |> validate_required([:tipo, :quantidade, :data_hora, :observacao, :produto_id])
  end
end
