use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :vw_wf_api, VwWfApiWeb.Endpoint,
  secret_key_base: "o16arWUKSbmKql1woAw6PNkxnNK61aQ8osQtPHh4Ps9va5NwalvIaNu+yukV8s26"

# Configure your database
config :vw_wf_api, VwWfApi.Repo,
  username: "postgres",
  password: "pass",
  database: "codex",
  hostname: "192.168.99.100",
  port: 5432,
  pool_size: 15

config :vw_wf_api,
  steam_api_key: "STEAM_API_KEY"
