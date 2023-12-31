defmodule PlanningPoker do
  defdelegate list_rooms(), to: PlanningPoker.Rooms.All, as: :call
  defdelegate get_room(id), to: PlanningPoker.Rooms.Show, as: :call
  defdelegate create_room(), to: PlanningPoker.Rooms.Create, as: :call

  defdelegate get_task(id), to: PlanningPoker.Tasks.Show, as: :call
  defdelegate done_task(id), to: PlanningPoker.Tasks.Done, as: :call
  defdelegate create_task(params), to: PlanningPoker.Tasks.Create, as: :call

  defdelegate create_task_room(params), to: PlanningPoker.TasksRooms.Create, as: :call
  defdelegate get_task_room(id), to: PlanningPoker.TasksRooms.Show, as: :call

  defdelegate create_task_pontuation(params), to: PlanningPoker.TasksPontuations.Create, as: :call
  defdelegate update_task_pontuation(params), to: PlanningPoker.TasksPontuations.Update, as: :call
  defdelegate get_task_pontuation(id), to: PlanningPoker.TasksPontuations.Show, as: :call

  defdelegate list_pontuations(), to: PlanningPoker.Pontuations.All, as: :call
  defdelegate get_pontuation(id), to: PlanningPoker.Pontuations.Show, as: :call
  defdelegate create_pontuation(params), to: PlanningPoker.Pontuations.Create, as: :call
  defdelegate delete_pontuation(params), to: PlanningPoker.Pontuations.Delete, as: :call

  defdelegate list_users(), to: PlanningPoker.Users.All, as: :call
  defdelegate get_user(id), to: PlanningPoker.Users.Show, as: :call
  defdelegate create_user(params), to: PlanningPoker.Users.Create, as: :call
  defdelegate update_user(params), to: PlanningPoker.Users.Update, as: :call
  defdelegate delete_user(id), to: PlanningPoker.Users.Delete, as: :call
end
