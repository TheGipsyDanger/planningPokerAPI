defmodule PlanningPoker.Repo.Migrations.CreateTasksPontuations do
  use Ecto.Migration

  def change do
    create table(:tasks_pontuations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :value, :float
      add :task_id, references(:tasks, on_delete: :nothing, type: :binary_id)
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:tasks_pontuations, [:task_id])
    create index(:tasks_pontuations, [:user_id])
  end
end
