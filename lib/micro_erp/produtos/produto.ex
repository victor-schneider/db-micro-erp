defmodule MicroErp.Produtos.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field :nome, :string
    field :sku, :string
    field :preco, :decimal
    field :saldo_atual, :integer
    many_to_many :categoria, MicroErp.Categorias.Categoria, join_through: "categoria_produtos"

    many_to_many :fornecedor, MicroErp.Fornecedores.Fornecedor,
      join_through: "fornecedor_produtos"

    has_many :movimentacoes, MicroErp.Movimentacoes.Movimentacao

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:nome, :sku, :preco, :saldo_atual])
    |> validate_required([:nome, :sku, :preco, :saldo_atual])
    |> unique_constraint(:sku)
  end
end
