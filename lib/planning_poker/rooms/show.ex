defmodule PlanningPoker.Rooms.Show do
  import Ecto.Query, only: [from: 2]

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Rooms.Room

  def call(id) do
    query =
      from(r in Room,
        where: r.room_id == ^id,
        left_join: t in assoc(r, :tasks),
        left_join: p in assoc(t, :pontuation),
        preload: [{:tasks, :pontuation}, tasks: t]
      )

    PlanningPokerWeb.Endpoint.broadcast("tasks:lobby", "update", %{sales_id: "001"})

    case query |> Repo.one() do
      nil -> {:error, %Error{status: :bad_request, result: "Room not found"}}
      result -> {:ok, result}
    end
  end
end
