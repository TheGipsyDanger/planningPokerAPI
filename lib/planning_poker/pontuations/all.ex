defmodule PlanningPoker.Pontuations.All do
  alias PlanningPoker.{Repo}
  alias PlanningPoker.Pontuations.Pontuation

  def call(), do: Repo.all(Pontuation)
end
