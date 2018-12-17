defmodule VwWfApiWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias VwWfApiWeb.Resolvers

  object :session do
    field :id, :id
    field :user, :user, resolve: dataloader(:sessions)
  end

  object :session_queries do
    @desc "Get all sessions"
    field :sessions, list_of(:session) do
      # middleware VwWfApiWeb.Middlewares.HandleFields
      resolve(&Resolvers.Session.list_sessions/3)
    end
  end
end
