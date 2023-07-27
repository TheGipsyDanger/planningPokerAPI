defmodule PlanningPoker.TasksRooms do
  @moduledoc """
  The TasksRooms context.
  """

  import Ecto.Query, warn: false
  alias PlanningPoker.Repo

  alias PlanningPoker.TasksRooms.TaskRoom

  @doc """
  Returns the list of tasks_rooms.

  ## Examples

      iex> list_tasks_rooms()
      [%TaskRoom{}, ...]

  """
  def list_tasks_rooms do
    Repo.all(TaskRoom)
  end

  @doc """
  Gets a single task_room.

  Raises `Ecto.NoResultsError` if the Task room does not exist.

  ## Examples

      iex> get_task_room!(123)
      %TaskRoom{}

      iex> get_task_room!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task_room!(id), do: Repo.get!(TaskRoom, id)

  @doc """
  Creates a task_room.

  ## Examples

      iex> create_task_room(%{field: value})
      {:ok, %TaskRoom{}}

      iex> create_task_room(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task_room(attrs \\ %{}) do
    %TaskRoom{}
    |> TaskRoom.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task_room.

  ## Examples

      iex> update_task_room(task_room, %{field: new_value})
      {:ok, %TaskRoom{}}

      iex> update_task_room(task_room, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task_room(%TaskRoom{} = task_room, attrs) do
    task_room
    |> TaskRoom.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task_room.

  ## Examples

      iex> delete_task_room(task_room)
      {:ok, %TaskRoom{}}

      iex> delete_task_room(task_room)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task_room(%TaskRoom{} = task_room) do
    Repo.delete(task_room)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task_room changes.

  ## Examples

      iex> change_task_room(task_room)
      %Ecto.Changeset{data: %TaskRoom{}}

  """
  def change_task_room(%TaskRoom{} = task_room, attrs \\ %{}) do
    TaskRoom.changeset(task_room, attrs)
  end
end
