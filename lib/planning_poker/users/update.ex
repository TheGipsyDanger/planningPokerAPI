defmodule PlanningPoker.Users.Update do
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Users.User

  def call(%{"id" => id} = user_params) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, _uuid} -> update_user(user_params)
    end

    case Repo.get(User, id) do
      nil -> {:error, %Error{status: 400, result: "User not found"}}
      user -> do_update(user, user_params)
    end
  end

  defp get_user(id), do: Repo.get(User, id)

  def update_user(%{"id" => id} = params) do
    case get_user(id) do
      nil -> {:error, "User not found!"}
      user -> do_update(user, params)
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
