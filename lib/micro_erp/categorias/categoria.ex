defmodule MicroErp.Categorias.Categoria do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categorias" do
    field :nome, :string
    field :descricao, :string
    many_to_many :produtos, MicroErp.Produtos.Produto, join_through: "categoria_produto"
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(categoria, attrs) do
    categoria
    |> cast(attrs, [:nome, :descricao])
    |> validate_required([:nome, :descricao])
  end
end
