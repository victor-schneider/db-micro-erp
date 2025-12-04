defmodule MicroErp.MovimentacoesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MicroErp.Movimentacoes` context.
  """

  @doc """
  Generate a movimentacao.
  """
  def movimentacao_fixture(attrs \\ %{}) do
    {:ok, movimentacao} =
      attrs
      |> Enum.into(%{
        data_hora: ~N[2025-12-03 23:17:00],
        observacao: "some observacao",
        quantidade: 42,
        references: "some references",
        tipo: :ENTRADA
      })
      |> MicroErp.Movimentacoes.create_movimentacao()

    movimentacao
  end
end
