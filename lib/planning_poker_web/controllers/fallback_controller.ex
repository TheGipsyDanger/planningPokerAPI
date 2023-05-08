defmodule PlanningPokerWeb.FallbackController do
  use PlanningPokerWeb, :controller
  alias PlanningPoker.Error
  alias PlanningPokerWeb.ErrorView

  # This clause handles errors returned by Ecto's insert/update/delete.
  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
