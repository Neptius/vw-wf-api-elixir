defmodule VwWfApiWeb.Middlewares.HandleFields do
  @behaviour Absinthe.Middleware
  def call(resolution, _) do
    # resolution
    selected_fields = resolution.definition.selections
    fields = Enum.map(selected_fields, &(Map.get(&1, :name) |> String.to_atom()))
    Map.put(resolution, :fields, fields)
  end
end
