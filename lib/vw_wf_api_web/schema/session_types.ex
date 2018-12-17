defmodule VwWfApiWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation
  alias VwWfApi.Accounts.User
  alias VwWfApi.Repo

  object :session do
    field :id, :id
    field :user, :user do
      resolve fn session, _, _ ->
        batch({MyAppWeb.Schema.Helpers, :by_id, User}, session.user_id, fn batch_results ->
          {:ok, Map.get(batch_results, session.user_id)}
        end)
      end
    end
  end
end
