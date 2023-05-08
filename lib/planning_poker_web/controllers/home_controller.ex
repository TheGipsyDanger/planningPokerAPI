defmodule PlanningPokerWeb.HomeController do
  use PlanningPokerWeb, :controller

  def index(conn, _params) do
    conn
    |> json(%{name: "HomeController"})
  end
end
