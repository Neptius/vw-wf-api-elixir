defmodule VwWfApiWeb.Resolvers.Session do
  alias VwWfApi.Accounts

  def list_sessions(_parent, _args, _resolution) do
    {:ok, Accounts.list_sessions()}
  end
end
