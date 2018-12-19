defmodule VwWfApiWeb.Schema.SessionTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias VwWfApiWeb.Resolvers

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

  input_object :update_user_input do
    field :id, non_null(:id)
    field :personaname, :string
  end

  object :user_queries do
    @desc "Get all users"
    field :list_users, list_of(:user) do
      # middleware VwWfApiWeb.Middlewares.HandleFields
      resolve(&Resolvers.User.list_users/3)
    end
  end

  object :user_mutations do
    @desc "Login user"
    field :login, :user do
      arg(:steamid, non_null(:string))
      resolve(&Resolvers.User.login_user/3)
    end

    @desc "Update user"
    field :update_user, :user do
      arg(:user, non_null(:update_user_input))
      resolve(&Resolvers.User.update_user/3)
    end
  end


  object :user_subscriptions do
    field :on_user_update, :user do
      arg :repo_name, non_null(:string)

      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments. You can think of it as a way to tell the
      # difference between
      # subscription {
      #   commentAdded(repoName: "absinthe-graphql/absinthe") { content }
      # }
      #
      # and
      #
      # subscription {
      #   commentAdded(repoName: "elixir-lang/elixir") { content }
      # }
      config fn args, _ ->
        {:ok, topic: args.repo_name}
      end

      # this tells Absinthe to run any subscriptions with this field every time
      # the :update_user mutation happens.
      # It also has a topic function used to find what subscriptions care about
      # this particular comment
      trigger :update_user, topic: fn user ->
        user.repository_name
      end

      resolve fn user, _, _ ->
        # this function is often not actually necessary, as the default resolver
        # for subscription functions will just do what we're doing here.
        # The point is, subscription resolvers receive whatever value triggers
        # the subscription, in our case a comment.
        {:ok, user}
      end

    end
  end
end
