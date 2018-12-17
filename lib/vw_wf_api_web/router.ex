defmodule VwWfApiWeb.Router do
  use VwWfApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/playground", Absinthe.Plug.GraphiQL, schema: VwWfApiWeb.Schema, interface: :playground

    forward "/", Absinthe.Plug, schema: VwWfApiWeb.Schema
  end
end
