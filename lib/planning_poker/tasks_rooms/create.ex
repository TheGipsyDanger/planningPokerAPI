defmodule PlanningPoker.TasksRooms.Create do
  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.TasksRooms.TaskRoom

  def call(params) do
    TaskRoom.changeset(%TaskRoom{}, params)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %TaskRoom{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
