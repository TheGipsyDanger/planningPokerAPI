defmodule PlanningPoker.Pontuations.Show do
  import Ecto.Query, only: [from: 2]
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
    query =
      from(u in Pontuation,
        where: u.id == ^id
      )

    query_two =
      from(u0 in PlanningPoker.Users.User,
        where: u0.id == ^"de60c476-ebfe-457e-82fb-8a89ccaa2519"
      )

    teste = query_two |> Repo.one()

    IO.inspect("AQUIIII")
    IO.inspect("AQUIIII")
    IO.inspect("AQUIIII")
    IO.inspect("AQUIIII")
    IO.inspect("AQUIIII")
    IO.inspect("AQUIIII")
    IO.inspect(teste)

    case query |> Repo.one() do
      nil -> {:error, %Error{status: :bad_request, result: "Pontuation not found"}}
      result -> {:ok, result}
    end
  end
end
