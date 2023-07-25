defmodule PlanningPoker.Tasks.Show do
  import Ecto.Query, only: [from: 2]
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Tasks.Task
  # alias PlanningPoker.Tasks.Task

  def call(id) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, uuid_checked} -> get_task(uuid_checked)
    end
  end

  def get_task(id) do
    query =
      from t in Task,
        where: t.id == ^id,
        left_join: tp in assoc(t, :tasks_pontuations),
        left_join: p in assoc(t, :pontuation),
        preload: [tasks_pontuations: tp, pontuation: p]

    response = query |> Repo.one()

    case response do
      nil -> {:error, %Error{status: :bad_request, result: "Task not found"}}
      result -> {:ok, result}
    end
  end
end
