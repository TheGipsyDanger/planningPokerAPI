defmodule PlanningPokerWeb.TasksChannel do
  use PlanningPokerWeb, :channel

  @impl true
  def join("tasks:" <> id, _payload, socket) do
    {:ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  @impl true
  def handle_in("entered_room", payload, socket) do
    broadcast(socket, "entered_room", payload)
    {:reply, {:ok, payload}, socket}
  end

  @impl true
  def handle_in("change_voted", payload, socket) do
    broadcast(socket, "change_voted", payload)
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (tasks:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end
end
