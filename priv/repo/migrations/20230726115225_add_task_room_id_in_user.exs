defmodule PlanningPoker.Repo.Migrations.AddTaskRoomIdInUser do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :task_room_id, references(:tasks_rooms, on_delete: :delete_all, type: :binary_id)
    end

    create index(:users, [:task_room_id])
  end
end
