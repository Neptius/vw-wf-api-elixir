# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vw_wf_api,
  ecto_repos: [VwWfApi.Repo]

# Configures the endpoint
config :vw_wf_api, VwWfApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PplOfyg+NftG4g9phfC2h1Sle3+rnqHo6YeORRji6JgDYGQdmxT9TH5DIrsJNpQe",
  render_errors: [view: VwWfApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: VwWfApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
