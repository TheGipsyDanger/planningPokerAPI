defmodule PlanningPoker.Users.Create do
  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Users.User

  def call(params) do
    User.changeset(%User{}, params)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result) do
    PlanningPokerWeb.Endpoint.broadcast("tasks:B69D5EE4", "update", %{
      message: "user novo na sala"
    })

    result
  end

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
