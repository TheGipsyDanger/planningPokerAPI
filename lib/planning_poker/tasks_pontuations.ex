defmodule PlanningPoker.TasksPontuations do
  @moduledoc """
  The TasksPontuations context.
  """

  import Ecto.Query, warn: false
  alias PlanningPoker.Repo

  alias PlanningPoker.TasksPontuations.TaskPontuation

  @doc """
  Returns the list of tasks_pontuations.

  ## Examples

      iex> list_tasks_pontuations()
      [%TaskPontuation{}, ...]

  """
  def list_tasks_pontuations do
    Repo.all(TaskPontuation)
  end

  @doc """
  Gets a single task_pontuation.

  Raises `Ecto.NoResultsError` if the Task pontuation does not exist.

  ## Examples

      iex> get_task_pontuation!(123)
      %TaskPontuation{}

      iex> get_task_pontuation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task_pontuation!(id), do: Repo.get!(TaskPontuation, id)

  @doc """
  Creates a task_pontuation.

  ## Examples

      iex> create_task_pontuation(%{field: value})
      {:ok, %TaskPontuation{}}

      iex> create_task_pontuation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task_pontuation(attrs \\ %{}) do
    %TaskPontuation{}
    |> TaskPontuation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task_pontuation.

  ## Examples

      iex> update_task_pontuation(task_pontuation, %{field: new_value})
      {:ok, %TaskPontuation{}}

      iex> update_task_pontuation(task_pontuation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task_pontuation(%TaskPontuation{} = task_pontuation, attrs) do
    task_pontuation
    |> TaskPontuation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task_pontuation.

  ## Examples

      iex> delete_task_pontuation(task_pontuation)
      {:ok, %TaskPontuation{}}

      iex> delete_task_pontuation(task_pontuation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task_pontuation(%TaskPontuation{} = task_pontuation) do
    Repo.delete(task_pontuation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task_pontuation changes.

  ## Examples

      iex> change_task_pontuation(task_pontuation)
      %Ecto.Changeset{data: %TaskPontuation{}}

  """
  def change_task_pontuation(%TaskPontuation{} = task_pontuation, attrs \\ %{}) do
    TaskPontuation.changeset(task_pontuation, attrs)
  end
end
