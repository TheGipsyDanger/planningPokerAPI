defmodule PlanningPoker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  alias PlanningPoker.Rooms.Room
  alias PlanningPoker.Pontuations.Pontuation

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "tasks" do
    field :name, :string
    belongs_to :room, Room
    has_one :pontuation, Pontuation

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :room_id])
    |> validate_required([:name, :room_id])
  end
end
