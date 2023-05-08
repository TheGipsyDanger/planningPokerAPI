defmodule PlanningPokerWeb.DefaultController do
  use PlanningPokerWeb, :controller

  def index(conn, _params) do
    conn
    |> json(%{status: "ok"})
  end
end
