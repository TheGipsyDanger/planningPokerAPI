defmodule PlanningPoker.Rooms.All do
  alias PlanningPoker.{Repo}
  alias PlanningPoker.Rooms.Room

  def call(), do: Repo.all(Room)
end
