defmodule PlanningPoker.TasksRooms.Show do
  import Ecto.Query, only: [from: 2]
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.TasksRooms.TaskRoom

  def call(id) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, uuid_checked} -> get_task_room(uuid_checked)
    end
  end

  def get_task_room(id) do
    query =
      from(tr in TaskRoom,
        where: tr.id == ^id,
        left_join: u in assoc(tr, :users),
        left_join: t in assoc(tr, :task),
        left_join: tp in assoc(t, :tasks_pontuations),
        left_join: utp in assoc(tp, :user),
        preload: [users: u, task: {t, tasks_pontuations: {tp, user: utp}}]
      )

    response = query |> Repo.one()

    case response do
      nil -> {:error, %Error{status: :bad_request, result: "Task room not found"}}
      result -> {:ok, result}
    end
  end
end
