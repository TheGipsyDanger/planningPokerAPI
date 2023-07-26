defmodule PlanningPoker.TasksPontuations.Update do
  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.TasksPontuations.TaskPontuation

  def call(%{"id" => id, "task_pontuation" => task_pontuation_params} = _params) do
    case Repo.get(TaskPontuation, id) do
      nil -> {:error, %Error{status: 400, result: "Task pontuation not found"}}
      task_pontuation -> do_update(task_pontuation, task_pontuation_params)
    end
  end

  def do_update(task_pontuation, params) do
    task_pontuation
    |> TaskPontuation.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %TaskPontuation{}} = result) do
    result
  end

  defp handle_update({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
