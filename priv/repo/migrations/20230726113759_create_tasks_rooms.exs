defmodule PlanningPoker.Repo.Migrations.CreateTasksRooms do
  use Ecto.Migration

  def change do
    create table(:tasks_rooms, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :status, :string
      add :task_id, references(:tasks, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:tasks_rooms, [:task_id])
  end
end
