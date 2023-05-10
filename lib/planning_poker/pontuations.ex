defmodule PlanningPoker.Pontuations do
  @moduledoc """
  The Pontuations context.
  """

  import Ecto.Query, warn: false
  alias PlanningPoker.Repo

  alias PlanningPoker.Pontuations.Pontuation

  @doc """
  Returns the list of pontuations.

  ## Examples

      iex> list_pontuations()
      [%Pontuation{}, ...]

  """
  def list_pontuations do
    Repo.all(Pontuation)
  end

  @doc """
  Gets a single pontuation.

  Raises `Ecto.NoResultsError` if the Pontuation does not exist.

  ## Examples

      iex> get_pontuation!(123)
      %Pontuation{}

      iex> get_pontuation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pontuation!(id), do: Repo.get!(Pontuation, id)

  @doc """
  Creates a pontuation.

  ## Examples

      iex> create_pontuation(%{field: value})
      {:ok, %Pontuation{}}

      iex> create_pontuation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pontuation(attrs \\ %{}) do
    %Pontuation{}
    |> Pontuation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pontuation.

  ## Examples

      iex> update_pontuation(pontuation, %{field: new_value})
      {:ok, %Pontuation{}}

      iex> update_pontuation(pontuation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pontuation(%Pontuation{} = pontuation, attrs) do
    pontuation
    |> Pontuation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pontuation.

  ## Examples

      iex> delete_pontuation(pontuation)
      {:ok, %Pontuation{}}

      iex> delete_pontuation(pontuation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pontuation(%Pontuation{} = pontuation) do
    Repo.delete(pontuation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pontuation changes.

  ## Examples

      iex> change_pontuation(pontuation)
      %Ecto.Changeset{data: %Pontuation{}}

  """
  def change_pontuation(%Pontuation{} = pontuation, attrs \\ %{}) do
    Pontuation.changeset(pontuation, attrs)
  end
end
