defmodule PlanningPokerWeb.ErrorView do
  use PlanningPokerWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]

  alias Ecto.Changeset

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("error.json", %{result: %Changeset{} = changeset}) do
    %{status: "Failure", data: %{}, message: translate_errors(changeset)}
  end

  def render("error.json", %{result: result}) do
    %{status: "Failure", data: %{}, message: result}
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", translate_value(value))
      end)
    end)
  end

  defp translate_value({:parameterized, Ecto.Enum, _map}), do: ""
  defp translate_value(value), do: to_string(value)
end
