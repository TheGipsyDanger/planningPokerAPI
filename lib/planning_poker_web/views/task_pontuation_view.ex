defmodule PlanningPokerWeb.TaskPontuationView do
  use PlanningPokerWeb, :view
  alias PlanningPokerWeb.TaskPontuationView

  def render("index.json", %{tasks_pontuations: tasks_pontuations}) do
    %{
      status: "Success",
      message: "",
      data: render_many(tasks_pontuations, TaskPontuationView, "task_pontuation.json")
    }
  end

  def render("show.json", %{task_pontuation: task_pontuation}) do
    %{
      status: "Success",
      message: "",
      data: render_one(task_pontuation, TaskPontuationView, "task_pontuation.json")
    }
  end

  def render("task_pontuation.json", %{task_pontuation: task_pontuation}) do
    %{
      id: task_pontuation.id,
      value: task_pontuation.value
    }
  end
end
