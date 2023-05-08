defmodule PlanningPokerWeb.ChangesetView do
  use PlanningPokerWeb, :view

  @doc """
  Traverses and translates changeset errors.

  See `Ecto.Changeset.traverse_errors/2` and
  `PlanningPokerWeb.ErrorHelpers.translate_error/1` for more details.
  """
  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def render("error.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: translate_errors(changeset)}
  end
end
