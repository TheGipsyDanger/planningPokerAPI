defmodule PlanningPokerWeb.RoomController do
  use PlanningPokerWeb, :controller

  alias PlanningPoker.Game
  alias PlanningPoker.Rooms.Room

  action_fallback PlanningPokerWeb.FallbackController

  def index(conn, _params) do
    rooms = PlanningPoker.list_rooms()
    render(conn, "index.json", rooms: rooms)
  end

  def create(conn, %{"room" => room_params}) do
    with {:ok, %Room{} = room} <- Game.create_room(room_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.room_path(conn, :show, room))
      |> render("show.json", room: room)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Room{} = room} <- PlanningPoker.get_room(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", room: room)
    end
  end

  def update(conn, %{"id" => id, "room" => room_params}) do
    room = Game.get_room!(id)

    with {:ok, %Room{} = room} <- Game.update_room(room, room_params) do
      render(conn, "show.json", room: room)
    end
  end

  def delete(conn, %{"id" => id}) do
    room = Game.get_room!(id)

    with {:ok, %Room{}} <- Game.delete_room(room) do
      send_resp(conn, :no_content, "")
    end
  end
end
