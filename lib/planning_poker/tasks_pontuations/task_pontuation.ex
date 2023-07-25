defmodule PlanningPoker.TasksPontuations.TaskPontuation do
  use Ecto.Schema
  import Ecto.Changeset

  alias PlanningPoker.Tasks.Task

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "tasks_pontuations" do
    field :value, :float
    belongs_to :task, Task
    timestamps()
  end

  @doc false
  def changeset(task_pontuation, attrs) do
    task_pontuation
    |> cast(attrs, [:value, :task_id])
    |> validate_required([:value, :task_id])
  end
end
