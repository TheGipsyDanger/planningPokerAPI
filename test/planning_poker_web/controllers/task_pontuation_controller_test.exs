defmodule PlanningPokerWeb.TaskPontuationControllerTest do
  use PlanningPokerWeb.ConnCase

  import PlanningPoker.TasksPontuationsFixtures

  alias PlanningPoker.TasksPontuations.TaskPontuation

  @create_attrs %{
    value: 120.5
  }
  @update_attrs %{
    value: 456.7
  }
  @invalid_attrs %{value: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tasks_pontuations", %{conn: conn} do
      conn = get(conn, Routes.task_pontuation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create task_pontuation" do
    test "renders task_pontuation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.task_pontuation_path(conn, :create), task_pontuation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.task_pontuation_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "value" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.task_pontuation_path(conn, :create), task_pontuation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update task_pontuation" do
    setup [:create_task_pontuation]

    test "renders task_pontuation when data is valid", %{conn: conn, task_pontuation: %TaskPontuation{id: id} = task_pontuation} do
      conn = put(conn, Routes.task_pontuation_path(conn, :update, task_pontuation), task_pontuation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.task_pontuation_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "value" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, task_pontuation: task_pontuation} do
      conn = put(conn, Routes.task_pontuation_path(conn, :update, task_pontuation), task_pontuation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete task_pontuation" do
    setup [:create_task_pontuation]

    test "deletes chosen task_pontuation", %{conn: conn, task_pontuation: task_pontuation} do
      conn = delete(conn, Routes.task_pontuation_path(conn, :delete, task_pontuation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.task_pontuation_path(conn, :show, task_pontuation))
      end
    end
  end

  defp create_task_pontuation(_) do
    task_pontuation = task_pontuation_fixture()
    %{task_pontuation: task_pontuation}
  end
end
