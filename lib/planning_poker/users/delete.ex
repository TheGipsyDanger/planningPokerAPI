defmodule PlanningPoker.Users.Delete do
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Users.User

  def call(id) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, uuid_checked} -> delete(uuid_checked)
    end
  end

  defp delete(uuid) do
    case get_user(uuid) do
      nil -> {:error, %Error{status: 400, result: "User not found!"}}
      user -> Repo.delete(user)
    end
  end

  defp get_user(uuid), do: Repo.get(User, uuid)
end
