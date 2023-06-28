defmodule PlanningPoker.Users.Show do
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Users.User

  def call(id) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, uuid_checked} -> get_user(uuid_checked)
    end
  end

  def get_user(id) do
    case User |> Repo.get(id) do
      nil -> {:error, %Error{status: :bad_request, result: "User not found"}}
      result -> {:ok, result}
    end
  end
end
