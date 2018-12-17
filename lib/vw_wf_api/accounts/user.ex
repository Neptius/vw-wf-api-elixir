defmodule VwWfApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias VwWfApi.Accounts.Session

  schema "users" do
    field :avatar, :string
    field :avatarfull, :string
    field :avatarmedium, :string
    field :personaname, :string
    field :profileurl, :string
    field :steamid, :string
    has_many :sessions, Session

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
