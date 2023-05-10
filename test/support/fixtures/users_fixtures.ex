defmodule PlanningPoker.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlanningPoker.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        nickname: "some nickname",
        user_type: :active
      })
      |> PlanningPoker.Users.create_user()

    user
  end
end
