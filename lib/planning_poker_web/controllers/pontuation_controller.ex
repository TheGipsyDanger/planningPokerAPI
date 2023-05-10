defmodule PlanningPokerWeb.PontuationController do
  use PlanningPokerWeb, :controller

  alias PlanningPoker.Pontuations
  alias PlanningPoker.Pontuations.Pontuation

  action_fallback PlanningPokerWeb.FallbackController

  def index(conn, _params) do
    pontuations = PlanningPoker.list_pontuations()
    render(conn, "index.json", pontuations: pontuations)
  end

  def create(conn, %{"pontuation" => pontuation_params}) do
    with {:ok, %Pontuation{} = pontuation} <- Pontuations.create_pontuation(pontuation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.pontuation_path(conn, :show, pontuation))
      |> render("show.json", pontuation: pontuation)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Pontuation{} = pontuation} <- PlanningPoker.get_pontuation(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", pontuation: pontuation)
    end
  end

  def update(conn, %{"id" => id, "pontuation" => pontuation_params}) do
    pontuation = Pontuations.get_pontuation!(id)

    with {:ok, %Pontuation{} = pontuation} <-
           Pontuations.update_pontuation(pontuation, pontuation_params) do
      render(conn, "show.json", pontuation: pontuation)
    end
  end

  def delete(conn, %{"id" => id}) do
    pontuation = Pontuations.get_pontuation!(id)

    with {:ok, %Pontuation{}} <- Pontuations.delete_pontuation(pontuation) do
      send_resp(conn, :no_content, "")
    end
  end
end
