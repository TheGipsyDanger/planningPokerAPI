defmodule PlanningPoker.Users.Create do
  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Users.User

  def call(params) do
    User.changeset(%User{}, params)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
