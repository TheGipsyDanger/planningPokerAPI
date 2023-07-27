defmodule PlanningPokerWeb.TaskRoomControllerTest do
  use PlanningPokerWeb.ConnCase

  import PlanningPoker.TasksRoomsFixtures

  alias PlanningPoker.TasksRooms.TaskRoom

  @create_attrs %{
    status: "some status"
  }
  @update_attrs %{
    status: "some updated status"
  }
  @invalid_attrs %{status: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tasks_rooms", %{conn: conn} do
      conn = get(conn, Routes.task_room_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create task_room" do
    test "renders task_room when data is valid", %{conn: conn} do
      conn = post(conn, Routes.task_room_path(conn, :create), task_room: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.task_room_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.task_room_path(conn, :create), task_room: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update task_room" do
    setup [:create_task_room]

    test "renders task_room when data is valid", %{conn: conn, task_room: %TaskRoom{id: id} = task_room} do
      conn = put(conn, Routes.task_room_path(conn, :update, task_room), task_room: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.task_room_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, task_room: task_room} do
      conn = put(conn, Routes.task_room_path(conn, :update, task_room), task_room: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete task_room" do
    setup [:create_task_room]

    test "deletes chosen task_room", %{conn: conn, task_room: task_room} do
      conn = delete(conn, Routes.task_room_path(conn, :delete, task_room))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.task_room_path(conn, :show, task_room))
      end
    end
  end

  defp create_task_room(_) do
    task_room = task_room_fixture()
    %{task_room: task_room}
  end
end
