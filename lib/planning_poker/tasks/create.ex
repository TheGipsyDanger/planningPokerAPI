defmodule PlanningPoker.Tasks.Create do
  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Tasks.Task

  def call(params) do
    Task.changeset(%Task{}, params)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Task{}} = result) do
    {:ok, task} = result
    PlanningPoker.create_task_room(%{status: "opened", task_id: task.id})
    result
  end

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
