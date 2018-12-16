defmodule VwWfApiWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :avatar, :string
    field :avatarfull, :string
    field :avatarmedium, :string
    field :personaname, :string
    field :profileurl, :string
    field :steamid, :string
  end
end
