defmodule VwWfApiWeb.Resolvers.User do
  alias VwWfApi.Accounts

  def list_users(_parent, args, _resolution) do
    {:ok, Accounts.list_users(args)}
  end

  def update_user(_parent, %{user: user}, _resolution) do
     Accounts.get_user!(user.id)
     |> Accounts.update_user(user)
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
