defmodule PlanningPoker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field(:user_type, Ecto.Enum, values: [:active, :observer])
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_type])
    |> validate_required([:user_type])
  end
end
