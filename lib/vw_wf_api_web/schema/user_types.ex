defmodule VwWfApiWeb.Schema.SessionTypes do
  use Absinthe.Schema.Notation

  alias VwWfApi.Repo

  object :user do
    field :id, :id
    field :avatar, :string
    field :avatarfull, :string
    field :avatarmedium, :string
    field :personaname, :string
    field :profileurl, :string
    field :steamid, :string
    field :sessions, list_of(:session) do
      resolve fn user, _, _ ->
        sessions =
          user
          |> Ecto.assoc(:sessions)
          |> Repo.all

        {:ok, sessions}
      end
    end
  end
end
