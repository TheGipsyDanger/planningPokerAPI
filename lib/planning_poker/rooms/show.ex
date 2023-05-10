defmodule PlanningPoker.Rooms.Show do
  import Ecto.Query, only: [from: 2]
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Rooms.Room
  # alias PlanningPoker.Tasks.Task

  def call(id) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, uuid_checked} -> get_room(uuid_checked)
    end
  end

  def get_room(id) do
    query =
      from u in Room,
        where: u.id == ^id

    case query |> Repo.one() do
      nil -> {:error, %Error{status: :bad_request, result: "Room not found"}}
      result -> {:ok, result}
    end
  end
end
