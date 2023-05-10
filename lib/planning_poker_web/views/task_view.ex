defmodule PlanningPokerWeb.TaskView do
  use PlanningPokerWeb, :view
  alias PlanningPokerWeb.TaskView
  alias PlanningPokerWeb.PontuationView

  def render("index.json", %{tasks: tasks}) do
    %{status: "Success", message: "", data: render_many(tasks, TaskView, "task.json")}
  end

  def render("create.json", %{task: task}) do
    %{status: "Success", message: "", data: render_one(task, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{status: "Success", message: "", data: render_one(task, TaskView, "taskFull.json")}
  end

  def render("task.json", %{task: task}) do
    %{
      id: task.id,
      name: task.name
    }
  end

  def render("taskFull.json", %{task: task}) do
    %{
      id: task.id,
      name: task.name,
      pontuation: render_one(task.pontuation, PontuationView, "pontuation.json")
    }
  end
end
