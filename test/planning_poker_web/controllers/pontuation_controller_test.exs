defmodule PlanningPokerWeb.PontuationControllerTest do
  use PlanningPokerWeb.ConnCase

  import PlanningPoker.PontuationsFixtures

  alias PlanningPoker.Pontuations.Pontuation

  @create_attrs %{
    value: "120.5"
  }
  @update_attrs %{
    value: "456.7"
  }
  @invalid_attrs %{value: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pontuations", %{conn: conn} do
      conn = get(conn, Routes.pontuation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pontuation" do
    test "renders pontuation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pontuation_path(conn, :create), pontuation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.pontuation_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "value" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pontuation_path(conn, :create), pontuation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pontuation" do
    setup [:create_pontuation]

    test "renders pontuation when data is valid", %{conn: conn, pontuation: %Pontuation{id: id} = pontuation} do
      conn = put(conn, Routes.pontuation_path(conn, :update, pontuation), pontuation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.pontuation_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "value" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pontuation: pontuation} do
      conn = put(conn, Routes.pontuation_path(conn, :update, pontuation), pontuation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pontuation" do
    setup [:create_pontuation]

    test "deletes chosen pontuation", %{conn: conn, pontuation: pontuation} do
      conn = delete(conn, Routes.pontuation_path(conn, :delete, pontuation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.pontuation_path(conn, :show, pontuation))
      end
    end
  end

  defp create_pontuation(_) do
    pontuation = pontuation_fixture()
    %{pontuation: pontuation}
  end
end
