defmodule PlanningPoker.Users.Delete do
  import(Ecto.Query, only: [from: 2])
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
    query =
      from u in User,
        where: u.id == ^uuid

    response = query |> Repo.one()

    case response do
      nil -> {:error, %Error{status: 400, result: "User not found!"}}
      user -> Repo.delete(user)
    end
  end
end
