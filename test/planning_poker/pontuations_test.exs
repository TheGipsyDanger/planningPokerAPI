defmodule PlanningPoker.PontuationsTest do
  use PlanningPoker.DataCase

  alias PlanningPoker.Pontuations

  describe "pontuations" do
    alias PlanningPoker.Pontuations.Pontuation

    import PlanningPoker.PontuationsFixtures

    @invalid_attrs %{value: nil}

    test "list_pontuations/0 returns all pontuations" do
      pontuation = pontuation_fixture()
      assert Pontuations.list_pontuations() == [pontuation]
    end

    test "get_pontuation!/1 returns the pontuation with given id" do
      pontuation = pontuation_fixture()
      assert Pontuations.get_pontuation!(pontuation.id) == pontuation
    end

    test "create_pontuation/1 with valid data creates a pontuation" do
      valid_attrs = %{value: "120.5"}

      assert {:ok, %Pontuation{} = pontuation} = Pontuations.create_pontuation(valid_attrs)
      assert pontuation.value == Decimal.new("120.5")
    end

    test "create_pontuation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pontuations.create_pontuation(@invalid_attrs)
    end

    test "update_pontuation/2 with valid data updates the pontuation" do
      pontuation = pontuation_fixture()
      update_attrs = %{value: "456.7"}

      assert {:ok, %Pontuation{} = pontuation} = Pontuations.update_pontuation(pontuation, update_attrs)
      assert pontuation.value == Decimal.new("456.7")
    end

    test "update_pontuation/2 with invalid data returns error changeset" do
      pontuation = pontuation_fixture()
      assert {:error, %Ecto.Changeset{}} = Pontuations.update_pontuation(pontuation, @invalid_attrs)
      assert pontuation == Pontuations.get_pontuation!(pontuation.id)
    end

    test "delete_pontuation/1 deletes the pontuation" do
      pontuation = pontuation_fixture()
      assert {:ok, %Pontuation{}} = Pontuations.delete_pontuation(pontuation)
      assert_raise Ecto.NoResultsError, fn -> Pontuations.get_pontuation!(pontuation.id) end
    end

    test "change_pontuation/1 returns a pontuation changeset" do
      pontuation = pontuation_fixture()
      assert %Ecto.Changeset{} = Pontuations.change_pontuation(pontuation)
    end
  end
end
