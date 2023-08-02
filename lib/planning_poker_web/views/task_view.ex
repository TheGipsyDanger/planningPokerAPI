defmodule PlanningPokerWeb.TaskView do
  use PlanningPokerWeb, :view
  alias PlanningPokerWeb.TaskView
  alias PlanningPokerWeb.PontuationView
  alias PlanningPokerWeb.TaskPontuationView
  alias PlanningPokerWeb.TaskRoomView

  def render("index.json", %{tasks: tasks}) do
    %{status: "Success", message: "", data: render_many(tasks, TaskView, "task.json")}
  end

  def render("create.json", %{task: task}) do
    %{status: "Success", message: "", data: render_one(task, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{status: "Success", message: "", data: render_one(task, TaskView, "taskFull.json")}
  end

  def render("showToRoom.json", %{task: task}) do
    %{
      id: task.id,
      name: task.name,
      pontuation: render_one(task.pontuation, PontuationView, "pontuationToRoom.json")
    }
  end

  def render("taskToTaskRoom.json", %{task: task}) do
    %{
      id: task.id,
      name: task.name,
      tasks_pontuations:
        render_many(
          task.tasks_pontuations,
          TaskPontuationView,
          "task_pontuation_to_task_room.json"
        )
    }
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
      pontuation: render_one(task.pontuation, PontuationView, "pontuation.json"),
      task_room: render_one(task.task_room, TaskRoomView, "task_room.json"),
      tasks_pontuations:
        render_many(task.tasks_pontuations, TaskPontuationView, "task_pontuation.json")
    }
  end
end
