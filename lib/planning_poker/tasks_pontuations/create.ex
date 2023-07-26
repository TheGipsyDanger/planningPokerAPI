defmodule PlanningPoker.TasksPontuations.Create do
  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.TasksPontuations.TaskPontuation

  def call(params) do
    TaskPontuation.changeset(%TaskPontuation{}, params)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %TaskPontuation{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
