defmodule PlanningPokerWeb.TaskPontuationController do
  use PlanningPokerWeb, :controller

  alias PlanningPoker.TasksPontuations
  alias PlanningPoker.TasksPontuations.TaskPontuation

  action_fallback PlanningPokerWeb.FallbackController

  def index(conn, _params) do
    tasks_pontuations = TasksPontuations.list_tasks_pontuations()
    render(conn, "index.json", tasks_pontuations: tasks_pontuations)
  end

  def create(conn, %{"task_pontuation" => task_pontuation_params}) do
    with {:ok, %TaskPontuation{} = task_pontuation} <-
           PlanningPoker.create_task_pontuation(task_pontuation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.task_pontuation_path(conn, :show, task_pontuation))
      |> render("create.json", task_pontuation: task_pontuation)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %TaskPontuation{} = task_pontuation} <- PlanningPoker.get_task_pontuation(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", task_pontuation: task_pontuation)
    end
  end

  def update(conn, %{"id" => id, "task_pontuation" => task_pontuation_params}) do
    task_pontuation = TasksPontuations.get_task_pontuation!(id)

    with {:ok, %TaskPontuation{} = task_pontuation} <-
           TasksPontuations.update_task_pontuation(task_pontuation, task_pontuation_params) do
      render(conn, "create.json", task_pontuation: task_pontuation)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_pontuation = TasksPontuations.get_task_pontuation!(id)

    with {:ok, %TaskPontuation{}} <- TasksPontuations.delete_task_pontuation(task_pontuation) do
      send_resp(conn, :no_content, "")
    end
  end
end
