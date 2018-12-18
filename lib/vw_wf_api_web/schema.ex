defmodule VwWfApiWeb.Schema do
  use Absinthe.Schema

  import_types(VwWfApiWeb.Schema.UserTypes)
  import_types(VwWfApiWeb.Schema.SessionTypes)

  alias VwWfApi.Accounts.{User, Session}

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(:users, User.data())
      |> Dataloader.add_source(:sessions, Session.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  query do
    import_fields(:user_queries)
    import_fields(:session_queries)
  end

  mutation do
    import_fields(:user_mutations)
  end

  subscription do
    import_fields(:user_subscriptions)
  end
end
