defmodule VwWfApiWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  alias VwWfApi.Repo

  object :session do
    field :id, :id
    field :user, :user do
      resolve fn session, _, _ ->
        user =
          session
          |> Ecto.assoc(:user)
          |> Repo.one

        {:ok, user}
      end
    end
  end
end
