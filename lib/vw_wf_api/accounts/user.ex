defmodule VwWfApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :avatarfull, :string
    field :avatarmedium, :string
    field :personaname, :string
    field :profileurl, :string
    field :steamid, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:steamid, :personaname, :profileurl, :avatar, :avatarmedium, :avatarfull])
    |> validate_required([
      :steamid,
      :personaname,
      :profileurl,
      :avatar,
      :avatarmedium,
      :avatarfull
    ])
  end
end
