defmodule PlanningPoker do
  alias PlanningPoker.Rooms.All, as: RoomAll
  alias PlanningPoker.Rooms.Show, as: RoomShow

  alias PlanningPoker.Tasks.Show, as: TaskShow

  alias PlanningPoker.Pontuations.All, as: PontuationAll
  alias PlanningPoker.Pontuations.Show, as: PontuationShow

  defdelegate list_rooms(), to: RoomAll, as: :call
  defdelegate get_room(id), to: RoomShow, as: :call

  defdelegate get_task(id), to: TaskShow, as: :call

  defdelegate list_pontuations(), to: PontuationAll, as: :call
  defdelegate get_pontuation(id), to: PontuationShow, as: :call
end
