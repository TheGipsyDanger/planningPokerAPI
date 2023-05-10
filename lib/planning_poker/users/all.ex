defmodule PlanningPoker.Users.All do
  alias PlanningPoker.{Repo}
  alias PlanningPoker.Users.User

  def call(), do: Repo.all(User)
end
