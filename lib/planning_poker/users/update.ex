defmodule PlanningPoker.Users.Update do
  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Users.User

  def call(%{"id" => id, "user" => user_params} = params) do
    case Repo.get(User, id) do
      nil -> {:error, %Error{status: 400, result: "User not found"}}
      user -> do_update(user, user_params)
    end
  end

  def do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %User{}} = result) do
    result
  end

  defp handle_update({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
