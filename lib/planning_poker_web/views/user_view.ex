defmodule PlanningPokerWeb.UserView do
  use PlanningPokerWeb, :view
  alias PlanningPokerWeb.UserView

  def render("index.json", %{users: users}) do
    %{status: "Success", message: "", data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{status: "Success", message: "", data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      user_type: user.user_type
    }
  end
end
