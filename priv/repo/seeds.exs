# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PlanningPoker.Repo.insert!(%PlanningPoker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, room} = PlanningPoker.create_room()

task_params_1 = %{name: "Correção do retorno do backend", room_id: room.id}
task_params_2 = %{name: "Ajuste nos icones da homepage", room_id: room.id}

{:ok, task_1} = PlanningPoker.create_task(task_params_1)
{:ok, task_2} = PlanningPoker.create_task(task_params_2)

IO.inspect("ROOM")
IO.inspect("ROOM")
IO.inspect(room.room_id)
IO.inspect("ROOM")
IO.inspect("ROOM")

# {:ok, user_1} = PlanningPoker.create_user(user_params_1)
# {:ok, user_2} = PlanningPoker.create_user(user_params_2)
# {:ok, user_3} = PlanningPoker.create_user(user_params_3)

# IO.inspect(user_1 |> PlanningPoker.Repo.preload(:task_room))
# IO.inspect(user_2 |> PlanningPoker.Repo.preload(:task_room))
# IO.inspect(user_3 |> PlanningPoker.Repo.preload(:task_room))
