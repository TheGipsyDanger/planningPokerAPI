defmodule PlanningPoker.TasksRoomsTest do
  use PlanningPoker.DataCase

  alias PlanningPoker.TasksRooms

  describe "tasks_rooms" do
    alias PlanningPoker.TasksRooms.TaskRoom

    import PlanningPoker.TasksRoomsFixtures

    @invalid_attrs %{status: nil}

    test "list_tasks_rooms/0 returns all tasks_rooms" do
      task_room = task_room_fixture()
      assert TasksRooms.list_tasks_rooms() == [task_room]
    end

    test "get_task_room!/1 returns the task_room with given id" do
      task_room = task_room_fixture()
      assert TasksRooms.get_task_room!(task_room.id) == task_room
    end

    test "create_task_room/1 with valid data creates a task_room" do
      valid_attrs = %{status: "some status"}

      assert {:ok, %TaskRoom{} = task_room} = TasksRooms.create_task_room(valid_attrs)
      assert task_room.status == "some status"
    end

    test "create_task_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TasksRooms.create_task_room(@invalid_attrs)
    end

    test "update_task_room/2 with valid data updates the task_room" do
      task_room = task_room_fixture()
      update_attrs = %{status: "some updated status"}

      assert {:ok, %TaskRoom{} = task_room} = TasksRooms.update_task_room(task_room, update_attrs)
      assert task_room.status == "some updated status"
    end

    test "update_task_room/2 with invalid data returns error changeset" do
      task_room = task_room_fixture()
      assert {:error, %Ecto.Changeset{}} = TasksRooms.update_task_room(task_room, @invalid_attrs)
      assert task_room == TasksRooms.get_task_room!(task_room.id)
    end

    test "delete_task_room/1 deletes the task_room" do
      task_room = task_room_fixture()
      assert {:ok, %TaskRoom{}} = TasksRooms.delete_task_room(task_room)
      assert_raise Ecto.NoResultsError, fn -> TasksRooms.get_task_room!(task_room.id) end
    end

    test "change_task_room/1 returns a task_room changeset" do
      task_room = task_room_fixture()
      assert %Ecto.Changeset{} = TasksRooms.change_task_room(task_room)
    end
  end
end
