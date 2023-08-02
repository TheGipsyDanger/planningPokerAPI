defmodule PlanningPoker.TasksPontuations.Show do
  import Ecto.Query, only: [from: 2]
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.TasksPontuations.TaskPontuation

  def call(id) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, uuid_checked} -> get_task_pontuation(uuid_checked)
    end
  end

  def get_task_pontuation(id) do
    query =
      from tp in TaskPontuation,
        where: tp.id == ^id,
        left_join: u in assoc(tp, :user),
        preload: [user: u]

    response = query |> Repo.one()

    IO.inspect("RESPONSE :::")
    IO.inspect(response)

    case response do
      nil -> {:error, %Error{status: :bad_request, result: "Task pontuation not found"}}
      result -> {:ok, result}
    end
  end
end
