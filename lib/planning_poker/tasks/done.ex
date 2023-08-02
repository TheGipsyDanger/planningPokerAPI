defmodule PlanningPoker.Tasks.Done do
  import Ecto.Query, only: [from: 2]
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}

  alias PlanningPoker.Tasks.Task
  alias PlanningPoker.Pontuations.Pontuation

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
        left_join: p in assoc(t, :pontuation),
        left_join: tp in assoc(t, :tasks_pontuations),
        preload: [pontuation: p, tasks_pontuations: tp]

    task = query |> Repo.one()

    case task.pontuation do
      nil -> create_pontuation()
      _ -> handle_update(task)
    end

    # if task.pontuation === nil do
    #   pontuation =
    #     Pontuation.changeset(%Pontuation{}, %{
    #       task_id: task.id,
    #       value:
    #         Enum.sum(Enum.map(task.tasks_pontuations, fn x -> x.value end)) /
    #           length(task.tasks_pontuations)
    #     })
    #     |> Repo.insert()

    #   task |> Task.changeset(%{pontuation: pontuation}) |> Repo.update()

    #   handle_update(
    #     {:ok,
    #      Task
    #      |> Repo.get(id)
    #      |> Repo.preload([:pontuation, :tasks_pontuations])}
    #   )
    # else
    #   handle_update({:ok, task})
    # end
  end

  defp create_pontuation() do
    IO.inspect("RENAN")
    IO.inspect("create_pontuation")
  end

  defp handle_update({:ok, %Task{}} = task), do: task

  defp handle_update({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
