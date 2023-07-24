defmodule PlanningPoker.Rooms.Show do
  import Ecto.Query, only: [from: 2]
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Rooms.Room

  def call(id) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, uuid_checked} -> get_room(uuid_checked)
    end
  end

  def get_room(id) do
    query =
      from(r in Room,
        where: r.id == ^id,
        join: t in assoc(r, :tasks),
        left_join: p in assoc(t, :pontuation),
        preload: [{:tasks, :pontuation}, tasks: t]
      )

    response = query |> Repo.one()

    IO.inspect(response)

    case(response) do
      nil -> {:error, %Error{status: :bad_request, result: "Room not found"}}
      result -> {:ok, result}
    end
  end
end
