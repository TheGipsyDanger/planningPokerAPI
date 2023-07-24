defmodule PlanningPokerWeb.PontuationView do
  use PlanningPokerWeb, :view
  alias PlanningPokerWeb.PontuationView

  def render("index.json", %{pontuations: pontuations}) do
    %{
      status: "Success",
      message: "",
      data: render_many(pontuations, PontuationView, "pontuation.json")
    }
  end

  def render("show.json", %{pontuation: pontuation}) do
    %{
      status: "Success",
      message: "",
      data: render_one(pontuation, PontuationView, "pontuation.json")
    }
  end

  def render("pontuationToRoom.json", %{pontuation: pontuation}) do
    %{
      value: Decimal.to_float(pontuation.value)
    }
  end

  def render("pontuation.json", %{pontuation: pontuation}) do
    %{
      id: pontuation.id,
      value: Decimal.to_float(pontuation.value),
      task_id: pontuation.task_id
    }
  end
end
