defmodule PlanningPoker.Pontuations.Delete do
  import PlanningPoker.Utils

  alias PlanningPoker.{Repo, Error}
  alias PlanningPoker.Pontuations.Pontuation

  def call(id) do
    case check_uuid(id) do
      {:error, error} -> {:error, %Error{status: 400, result: error}}
      {:ok, uuid_checked} -> get_pontuation(uuid_checked)
    end
  end

  def get_pontuation(id) do
    case Pontuation |> Repo.get(id) do
      nil -> {:error, %Error{status: :bad_request, result: "Pontuation not found"}}
      pontuation -> delete_pontuation(pontuation)
    end
  end

  def delete_pontuation(%Pontuation{} = pontuation) do
    case Repo.delete(pontuation) do
      nil -> {:error, %Error{status: :bad_request, result: "Pontuation not found"}}
      result -> result
    end
  end
end
