defmodule PlanningPoker.TasksRooms.TaskRoom do
  use Ecto.Schema
  import Ecto.Changeset

  alias PlanningPoker.Tasks.Task
  alias PlanningPoker.Users.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "tasks_rooms" do
    field(:status, Ecto.Enum, values: [:opened, :done])
    belongs_to :task, Task
    has_many :users, User
    timestamps()
  end

  @doc false
  def changeset(task_room, attrs) do
    task_room
    |> cast(attrs, [:status, :task_id])
    |> validate_required([:status, :task_id])
  end
end
