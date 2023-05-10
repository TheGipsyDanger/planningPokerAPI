defmodule PlanningPoker.Repo.Migrations.CreatePontuations do
  use Ecto.Migration

  def change do
    create table(:pontuations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :value, :decimal
      add :task_id, references(:tasks, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:pontuations, [:task_id])
  end
end
