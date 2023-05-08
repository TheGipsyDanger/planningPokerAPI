defmodule PlanningPoker.Utils do
  import Ecto.UUID

  def check_uuid(uuid) do
    case cast(uuid) do
      :error ->
        {:error, "invalid id format"}

      {:ok, uuid_checked} ->
        {:ok, uuid_checked}
    end
  end
end
