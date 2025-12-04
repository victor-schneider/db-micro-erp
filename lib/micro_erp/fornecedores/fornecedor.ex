defmodule MicroErp.Fornecedores.Fornecedor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fornecedores" do
    field :nome, :string
    field :cnpj, :string
    field :contato, :string
    has_many :produtos, MicroErp.Produtos.Produto

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(fornecedor, attrs) do
    fornecedor
    |> cast(attrs, [:nome, :cnpj, :contato])
    |> validate_required([:nome, :cnpj, :contato])
    |> unique_constraint(:cnpj)
  end
end
