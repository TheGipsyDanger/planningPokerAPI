defmodule PlanningPoker do
  alias PlanningPoker.Room.All, as: RoomAll
  alias PlanningPoker.Room.Show, as: RoomShow

  defdelegate list_rooms(), to: RoomAll, as: :call
  defdelegate get_room(id), to: RoomShow, as: :call
end
