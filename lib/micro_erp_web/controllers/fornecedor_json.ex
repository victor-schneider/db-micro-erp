defmodule MicroErpWeb.FornecedorJSON do
  alias MicroErp.Fornecedores.Fornecedor

  @doc """
  Renders a list of fornecedores.
  """
  def index(%{fornecedores: fornecedores}) do
    %{data: for(fornecedor <- fornecedores, do: data(fornecedor))}
  end

  @doc """
  Renders a single fornecedor.
  """
  def show(%{fornecedor: fornecedor}) do
    %{data: data(fornecedor)}
  end

  defp data(%Fornecedor{} = fornecedor) do
    %{
      id: fornecedor.id,
      nome: fornecedor.nome,
      cnpj: fornecedor.cnpj,
      contato: fornecedor.contato
    }
  end
end
