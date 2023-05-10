defmodule PlanningPoker.PontuationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlanningPoker.Pontuations` context.
  """

  @doc """
  Generate a pontuation.
  """
  def pontuation_fixture(attrs \\ %{}) do
    {:ok, pontuation} =
      attrs
      |> Enum.into(%{
        value: "120.5"
      })
      |> PlanningPoker.Pontuations.create_pontuation()

    pontuation
  end
end
