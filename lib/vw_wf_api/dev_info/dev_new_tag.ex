defmodule VwWfApi.DevInfo.DevNewTag do
  use Ecto.Schema
  import Ecto.Changeset


  schema "dev_news_tag" do
    field :name, :string
    field :color, :string

    timestamps()
  end

  @doc false
  def changeset(dev_new_tag, attrs) do
    dev_new_tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
