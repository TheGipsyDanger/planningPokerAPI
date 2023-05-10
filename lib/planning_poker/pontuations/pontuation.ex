defmodule PlanningPoker.Pontuations.Pontuation do
  use Ecto.Schema
  import Ecto.Changeset

  alias PlanningPoker.Tasks.Task

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "pontuations" do
    field :value, :decimal
    belongs_to :task, Task

    timestamps()
  end

  @doc false
  def changeset(pontuation, attrs) do
    pontuation
    |> cast(attrs, [:value, :task_id])
    |> validate_required([:value, :task_id])
  end
end
