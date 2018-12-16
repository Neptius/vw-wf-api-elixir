defmodule VwWfApiWeb.Router do
  use VwWfApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", VwWfApiWeb do
    pipe_through :api
  end
end
