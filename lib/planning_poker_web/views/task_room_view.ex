defmodule PlanningPokerWeb.TaskRoomView do
  use PlanningPokerWeb, :view
  alias PlanningPokerWeb.TaskRoomView
  alias PlanningPokerWeb.UserView
  alias PlanningPokerWeb.TaskView

  def render("index.json", %{tasks_rooms: tasks_rooms}) do
    %{
      status: "Success",
      message: "",
      data: render_many(tasks_rooms, TaskRoomView, "task_room.json")
    }
  end

  def render("show.json", %{task_room: task_room}) do
    %{
      status: "Success",
      message: "",
      data: render_one(task_room, TaskRoomView, "task_room_with_user.json")
    }
  end

  def render("task_room_with_user.json", %{task_room: task_room}) do
    %{
      id: task_room.id,
      status: task_room.status,
      task: render_one(task_room.task, TaskView, "task.json"),
      users: render_many(task_room.users, UserView, "user.json")
    }
  end

  def render("task_room.json", %{task_room: task_room}) do
    %{
      id: task_room.id,
      status: task_room.status
    }
  end
end
