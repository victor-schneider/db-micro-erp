defmodule MicroErpWeb.CategoriaJSON do
  alias MicroErp.Categorias.Categoria

  @doc """
  Renders a list of categorias.
  """
  def index(%{categorias: categorias}) do
    %{data: for(categoria <- categorias, do: data(categoria))}
  end

  @doc """
  Renders a single categoria.
  """
  def show(%{categoria: categoria}) do
    %{data: data(categoria)}
  end

  defp data(%Categoria{} = categoria) do
    %{
      id: categoria.id,
      nome: categoria.nome,
      descricao: categoria.descricao
    }
  end
end
