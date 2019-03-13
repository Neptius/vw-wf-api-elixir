defmodule VwWfApi.DevInfo.DevNew do
  use Ecto.Schema
  import Ecto.Changeset

  alias VwWfApi.DevInfo.DevNewTag

  def data() do
    Dataloader.Ecto.new(VwWfApi.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

  schema "dev_news" do
    field :content, :string
    belongs_to :tag, DevNewTag

    timestamps()
  end

  @doc false
  def changeset(dev_new, attrs) do
    dev_new
    |> cast(attrs, [])
    |> validate_required([
      :content
    ])
  end
end
