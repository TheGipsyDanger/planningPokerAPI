defmodule PlanningPokerWeb.TaskPontuationView do
  use PlanningPokerWeb, :view

  alias PlanningPokerWeb.TaskPontuationView
  alias PlanningPokerWeb.UserView

  def(render("index.json", %{tasks_pontuations: tasks_pontuations})) do
    %{
      status: "Success",
      message: "",
      data:
        render_many(tasks_pontuations, TaskPontuationView, "task_pontuation_without_user.json")
    }
  end

  def render("show.json", %{task_pontuation: task_pontuation}) do
    %{
      status: "Success",
      message: "",
      data: render_one(task_pontuation, TaskPontuationView, "task_pontuation.json")
    }
  end

  def render("create.json", %{task_pontuation: task_pontuation}) do
    %{
      status: "Success",
      message: "",
      data: render_one(task_pontuation, TaskPontuationView, "task_pontuation_without_user.json")
    }
  end

  def render("task_pontuation.json", %{task_pontuation: task_pontuation}) do
    %{
      id: task_pontuation.id,
      value: task_pontuation.value
    }
  end

  def render("task_pontuation_to_task_room.json", %{task_pontuation: task_pontuation}) do
    %{
      id: task_pontuation.id,
      value: task_pontuation.value,
      user_id: task_pontuation.user.id,
      user_type: task_pontuation.user.user_type
    }
  end

  def render("task_pontuation_without_user.json", %{task_pontuation: task_pontuation}) do
    %{
      id: task_pontuation.id,
      value: task_pontuation.value
    }
  end
end
