defmodule PlanningPoker.TasksPontuationsTest do
  use PlanningPoker.DataCase

  alias PlanningPoker.TasksPontuations

  describe "tasks_pontuations" do
    alias PlanningPoker.TasksPontuations.TaskPontuation

    import PlanningPoker.TasksPontuationsFixtures

    @invalid_attrs %{value: nil}

    test "list_tasks_pontuations/0 returns all tasks_pontuations" do
      task_pontuation = task_pontuation_fixture()
      assert TasksPontuations.list_tasks_pontuations() == [task_pontuation]
    end

    test "get_task_pontuation!/1 returns the task_pontuation with given id" do
      task_pontuation = task_pontuation_fixture()
      assert TasksPontuations.get_task_pontuation!(task_pontuation.id) == task_pontuation
    end

    test "create_task_pontuation/1 with valid data creates a task_pontuation" do
      valid_attrs = %{value: 120.5}

      assert {:ok, %TaskPontuation{} = task_pontuation} = TasksPontuations.create_task_pontuation(valid_attrs)
      assert task_pontuation.value == 120.5
    end

    test "create_task_pontuation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TasksPontuations.create_task_pontuation(@invalid_attrs)
    end

    test "update_task_pontuation/2 with valid data updates the task_pontuation" do
      task_pontuation = task_pontuation_fixture()
      update_attrs = %{value: 456.7}

      assert {:ok, %TaskPontuation{} = task_pontuation} = TasksPontuations.update_task_pontuation(task_pontuation, update_attrs)
      assert task_pontuation.value == 456.7
    end

    test "update_task_pontuation/2 with invalid data returns error changeset" do
      task_pontuation = task_pontuation_fixture()
      assert {:error, %Ecto.Changeset{}} = TasksPontuations.update_task_pontuation(task_pontuation, @invalid_attrs)
      assert task_pontuation == TasksPontuations.get_task_pontuation!(task_pontuation.id)
    end

    test "delete_task_pontuation/1 deletes the task_pontuation" do
      task_pontuation = task_pontuation_fixture()
      assert {:ok, %TaskPontuation{}} = TasksPontuations.delete_task_pontuation(task_pontuation)
      assert_raise Ecto.NoResultsError, fn -> TasksPontuations.get_task_pontuation!(task_pontuation.id) end
    end

    test "change_task_pontuation/1 returns a task_pontuation changeset" do
      task_pontuation = task_pontuation_fixture()
      assert %Ecto.Changeset{} = TasksPontuations.change_task_pontuation(task_pontuation)
    end
  end
end
