defmodule VwWfApiWeb.Schema.SessionTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :user do
    field :id, :id
    field :avatar, :string
    field :avatarfull, :string
    field :avatarmedium, :string
    field :personaname, :string
    field :profileurl, :string
    field :steamid, :string
    field :sessions, list_of(:session), resolve: dataloader(:users)
  end
end
