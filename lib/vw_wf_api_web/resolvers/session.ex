defmodule VwWfApiWeb.Resolvers.Session do
  alias VwWfApi.Accounts

  def list_sessions(_parent, _args, _resolution) do
    # fields = _resolution.definition.selections
    # select = Enum.map(fields, &(Map.get(&1, :name)|>String.to_atom))
    {:ok, Accounts.list_sessions()}
  end
end
