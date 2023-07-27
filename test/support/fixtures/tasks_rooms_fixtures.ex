defmodule PlanningPoker.TasksRoomsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlanningPoker.TasksRooms` context.
  """

  @doc """
  Generate a task_room.
  """
  def task_room_fixture(attrs \\ %{}) do
    {:ok, task_room} =
      attrs
      |> Enum.into(%{
        status: "some status"
      })
      |> PlanningPoker.TasksRooms.create_task_room()

    task_room
  end
end
