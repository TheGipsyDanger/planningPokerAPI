defmodule PlanningPoker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias PlanningPoker.TasksRooms.TaskRoom
  alias PlanningPoker.TasksPontuations.TaskPontuation

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    field :user_type, Ecto.Enum, values: [:active, :observer]
    belongs_to :task_room, TaskRoom
    has_one :tasks_pontuations, TaskPontuation, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_type, :task_room_id])
    |> validate_required([:user_type, :task_room_id])
  end
end
