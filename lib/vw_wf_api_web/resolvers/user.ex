defmodule VwWfApiWeb.Resolvers.User do
  alias VwWfApi.Accounts

  def list_users(_parent, _args, _resolution) do
    # fields = _resolution.definition.selections
    # select = Enum.map(fields, &(Map.get(&1, :name)|>String.to_atom))
    {:ok, Accounts.list_users()}
  end

  def login_user(_parent, %{steamid: steamid}, _resolution) do
    get_user(steamid)
    |> Map.get("response")
    |> Map.get("players")
    |> List.first()
    |> Accounts.create_user()
  end

  defp get_user(steamid) do
    response =
      HTTPoison.get!(
        "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" <>
          Application.get_env(:vw_wf_api, :steam_api_key) <> "&steamids=" <> steamid
      )

    Poison.decode!(response.body)
  end
end
