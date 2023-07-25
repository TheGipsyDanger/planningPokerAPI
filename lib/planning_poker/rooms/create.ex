defmodule PlanningPoker.Rooms.Create do
  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Rooms.Room
  alias UUID
  alias String
  alias List

  def call(params) do
    room_id =
      UUID.uuid4()
      |> String.slice(-8, 8)
      |> String.upcase()

    full_params = Map.merge(params, %{"room_id" => room_id})

    Room.changeset(%Room{}, full_params)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Room{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
