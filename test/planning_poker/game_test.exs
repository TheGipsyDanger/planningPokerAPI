defmodule PlanningPoker.GameTest do
  use PlanningPoker.DataCase

  alias PlanningPoker.Game

  describe "rooms" do
    alias PlanningPoker.Game.Room

    import PlanningPoker.GameFixtures

    @invalid_attrs %{has_password: nil}

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Game.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Game.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      valid_attrs = %{has_password: "some has_password"}

      assert {:ok, %Room{} = room} = Game.create_room(valid_attrs)
      assert room.has_password == "some has_password"
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      update_attrs = %{has_password: "some updated has_password"}

      assert {:ok, %Room{} = room} = Game.update_room(room, update_attrs)
      assert room.has_password == "some updated has_password"
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_room(room, @invalid_attrs)
      assert room == Game.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Game.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Game.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Game.change_room(room)
    end
  end
end
