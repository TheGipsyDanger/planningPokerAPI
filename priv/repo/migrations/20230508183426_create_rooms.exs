defmodule PlanningPoker.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :has_password, :string

      timestamps()
    end
  end
end
