defmodule VwWfApiWeb.Schema do
  use Absinthe.Schema

  import_types(VwWfApiWeb.Schema.UserTypes)
  import_types(VwWfApiWeb.Schema.SessionTypes)

  alias VwWfApiWeb.Resolvers
  alias VwWfApi.Accounts.{User, Session}

  def context(ctx) do
    loader =
      Dataloader.new
      |> Dataloader.add_source(:users, User.data())
      |> Dataloader.add_source(:sessions, Session.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      # middleware VwWfApiWeb.Middlewares.HandleFields
      resolve(&Resolvers.User.list_users/3)
    end

    @desc "Get all sessions"
    field :sessions, list_of(:session) do
      # middleware VwWfApiWeb.Middlewares.HandleFields
      resolve(&Resolvers.Session.list_sessions/3)
    end
  end

  mutation do
    @desc "Login user"
    field :login, :user do
      arg(:steamid, non_null(:string))
      resolve(&Resolvers.User.login_user/3)
    end
  end
end
