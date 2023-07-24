defmodule PlanningPoker.Rooms.Room do
  use Ecto.Schema
  import Ecto.Changeset

  alias PlanningPoker.Tasks.Task

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "rooms" do
    field :has_password, :string
    has_many :tasks, Task
    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:has_password])
    |> validate_required([:has_password])
  end
end
