defmodule PlanningPoker.Repo.Migrations.AddTaskRoomIdInTask do
  use Ecto.Migration

  def change do
    alter table("tasks") do
      add :task_room_id, references(:tasks, on_delete: :nothing, type: :binary_id)
    end

    create index(:tasks, [:task_room_id])
  end
end
