defmodule VwWfApiWeb.Schema do
  use Absinthe.Schema
  import_types(VwWfApiWeb.Schema.UserTypes)

  alias VwWfApiWeb.Resolvers

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.User.list_users/3)
    end
  end
end
