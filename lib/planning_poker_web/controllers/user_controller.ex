defmodule PlanningPokerWeb.UserController do
  use PlanningPokerWeb, :controller

  alias PlanningPoker.Users
  alias PlanningPoker.Users.User

  action_fallback PlanningPokerWeb.FallbackController

  def index(conn, _params) do
    users = PlanningPoker.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- PlanningPoker.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- PlanningPoker.get_user(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- PlanningPoker.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
