defmodule VwWfApiWeb.Router do
  use VwWfApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: VwWfApiWeb.Schema, interface: :playground

    forward "/", Absinthe.Plug, schema: VwWfApiWeb.Schema
  end
end
