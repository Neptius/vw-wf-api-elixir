defmodule VwWfApiWeb.Schema.DevNewTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias VwWfApiWeb.Resolvers

  import_types Absinthe.Type.Custom

  object :dev_new do
    field :id, non_null(:id)
    field :content, :string
    field :tag, :dev_new_tag, resolve: dataloader(:dev_news)
  end

  object :dev_new_tag do
    field :id, :id
    field :color, :string
    field :name, :string
  end

  input_object :dev_new_input do
    field :content, :string
    field :tag_id, :id
  end

  object :dev_new_queries do
    @desc "Get all dev news"
    field :dev_news, list_of(:dev_new) do
      # middleware VwWfApiWeb.Middlewares.HandleFields
      resolve(&Resolvers.DevNew.list_dev_news/3)
    end
  end

  object :dev_new_mutations do
    @desc "Create dev news"
    field :create_dev_new, :dev_new do
      arg :dev_new, non_null(:dev_new_input)

      resolve(&Resolvers.DevNew.create_dev_new/3)
    end
  end

end
