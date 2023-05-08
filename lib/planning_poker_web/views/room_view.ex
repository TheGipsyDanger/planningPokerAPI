defmodule PlanningPokerWeb.RoomView do
  use PlanningPokerWeb, :view
  alias PlanningPokerWeb.RoomView

  def render("index.json", %{rooms: rooms}) do
    %{status: "Success", message: "", data: render_many(rooms, RoomView, "room.json")}
  end

  def render("show.json", %{room: room}) do
    %{status: "Success", message: "", data: render_one(room, RoomView, "room.json")}
  end

  def render("room.json", %{room: room}) do
    %{
      id: room.id,
      has_password: room.has_password
    }
  end
end
