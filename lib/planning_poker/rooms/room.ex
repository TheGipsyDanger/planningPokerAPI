defmodule PlanningPoker.Rooms.Room do
  use Ecto.Schema
  import Ecto.Changeset

  alias PlanningPoker.Tasks.Task

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "rooms" do
    field :room_id, :string
    has_many :tasks, Task

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:room_id])
    |> validate_required([:room_id])
  end
end
