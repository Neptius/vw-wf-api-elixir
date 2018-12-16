defmodule VwWfApi.Repo do
  use Ecto.Repo,
    otp_app: :vw_wf_api,
    adapter: Ecto.Adapters.Postgres
end
