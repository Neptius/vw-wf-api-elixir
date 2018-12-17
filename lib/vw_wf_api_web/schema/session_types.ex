defmodule VwWfApiWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :session do
    field :id, :id
    field :user, :user, resolve: dataloader(:sessions)
  end
end
