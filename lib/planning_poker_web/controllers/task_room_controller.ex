defmodule PlanningPokerWeb.TaskRoomController do
  use PlanningPokerWeb, :controller

  alias PlanningPoker.TasksRooms
  alias PlanningPoker.TasksRooms.TaskRoom

  action_fallback PlanningPokerWeb.FallbackController

  def index(conn, _params) do
    tasks_rooms = TasksRooms.list_tasks_rooms()
    render(conn, "index.json", tasks_rooms: tasks_rooms)
  end

  def create(conn, %{"task_room" => task_room_params}) do
    with {:ok, %TaskRoom{} = task_room} <- TasksRooms.create_task_room(task_room_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.task_room_path(conn, :show, task_room))
      |> render("show.json", task_room: task_room)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %TaskRoom{} = task_room} <- PlanningPoker.get_task_room(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", task_room: task_room)
    end
  end

  def update(conn, %{"id" => id, "task_room" => task_room_params}) do
    task_room = TasksRooms.get_task_room!(id)

    with {:ok, %TaskRoom{} = task_room} <-
           TasksRooms.update_task_room(task_room, task_room_params) do
      render(conn, "show.json", task_room: task_room)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_room = TasksRooms.get_task_room!(id)

    with {:ok, %TaskRoom{}} <- TasksRooms.delete_task_room(task_room) do
      send_resp(conn, :no_content, "")
    end
  end
end
