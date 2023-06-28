defmodule PlanningPoker.TasksPontuationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlanningPoker.TasksPontuations` context.
  """

  @doc """
  Generate a task_pontuation.
  """
  def task_pontuation_fixture(attrs \\ %{}) do
    {:ok, task_pontuation} =
      attrs
      |> Enum.into(%{
        value: 120.5
      })
      |> PlanningPoker.TasksPontuations.create_task_pontuation()

    task_pontuation
  end
end
