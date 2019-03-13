defmodule VwWfApi.DevInfo.DevNewTag do
  use Ecto.Schema
  import Ecto.Changeset

  def data() do
    Dataloader.Ecto.new(VwWfApi.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

  schema "dev_new_tags" do
    field :name, :string
    field :color, :string

    timestamps()
  end

  @doc false
  def changeset(dev_new_tag, attrs) do
    dev_new_tag
    |> cast(attrs, [])
    |> validate_required([
      :name,
      :color
    ])
  end
end
