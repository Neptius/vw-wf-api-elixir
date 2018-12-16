defmodule VwWfApiWeb.Resolvers.User do
  alias VwWfApi.Accounts

  def list_users(_parent, _args, _resolution) do
    {:ok, Accounts.list_users()}
  end
end
