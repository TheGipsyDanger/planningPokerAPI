defmodule PlanningPoker.Room.Show do
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Rooms.Room

  def call(id) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, uuid_checked} -> get_client(uuid_checked)
    end
  end

  def get_client(id) do
    case Room |> Repo.get(id) do
      nil -> {:error, %Error{status: :bad_request, result: "Room not found"}}
      result -> {:ok, result}
    end
  end
end
