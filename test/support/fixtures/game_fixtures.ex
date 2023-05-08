defmodule PlanningPoker.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlanningPoker.Game` context.
  """

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        has_password: "some has_password"
      })
      |> PlanningPoker.Game.create_room()

    room
  end
end
