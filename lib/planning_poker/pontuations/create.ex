defmodule PlanningPoker.Pontuations.Create do
  import Float
  import Ecto.Query, only: [from: 2]

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Pontuations.Pontuation
  alias PlanningPoker.TasksPontuations.TaskPontuation

  def call(params) do
    # id = "7fb26f0a-9195-4a4d-b82a-91216bbb6820"

    # query =
    #   from u in TaskPontuation,
    #     where: u.task_id == ^id,
    #     select: avg(u.value)

    # IO.inspect(query |> Repo.one() |> Float.floor(2))

    # query = {:error, Error.build(:bad_request, "result")}
  end

  defp handle_insert({:ok, %Pontuation{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
