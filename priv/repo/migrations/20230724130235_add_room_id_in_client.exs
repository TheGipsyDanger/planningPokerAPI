defmodule PlanningPoker.Repo.Migrations.AddRoomIdInClient do
  use Ecto.Migration

  def change do
    alter table("rooms") do
      add :room_id, :text
    end
  end
end
