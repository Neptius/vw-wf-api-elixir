defmodule VwWfApiWeb.Schema.SessionTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias VwWfApiWeb.Resolvers

  object :user do
    field :id, :id
    field :avatar, :string
    field :avatarfull, :string
    field :avatarmedium, :string
    field :personaname, :string
    field :profileurl, :string
    field :steamid, :string
    field :sessions, list_of(:session), resolve: dataloader(:users)
  end

  object :user_queries do
    @desc "Get all users"
    field :users, list_of(:user) do
      # middleware VwWfApiWeb.Middlewares.HandleFields
      resolve(&Resolvers.User.list_users/3)
    end
  end

  object :user_mutations do
    @desc "Login user"
    field :login, :user do
      arg(:steamid, non_null(:string))
      resolve(&Resolvers.User.login_user/3)
    end
  end
end
