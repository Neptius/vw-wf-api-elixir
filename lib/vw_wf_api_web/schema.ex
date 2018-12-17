defmodule VwWfApiWeb.Schema do
  use Absinthe.Schema
  import_types(VwWfApiWeb.Schema.UserTypes)

  alias VwWfApiWeb.Resolvers

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      middleware VwWfApiWeb.Middlewares.HandleFields
      resolve(&Resolvers.User.list_users/3)
    end
  end

  mutation do
    @desc "Login user"
    field :login, :user do
      arg(:steamid, non_null(:string))
      resolve(&Resolvers.User.login_user/3)
    end
  end
end
