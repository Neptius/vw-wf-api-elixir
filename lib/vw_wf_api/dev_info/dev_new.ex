defmodule VwWfApi.DevInfo.DevNew do
  use Ecto.Schema
  import Ecto.Changeset

  alias VwWfApi.DevInfo.DevNewTag

  schema "dev_news" do
    field :content, :string
    belong_to :tag, DevNewTag

    timestamps()
  end

  @doc false
  def changeset(dev_new, attrs) do
    dev_new
    |> cast(attrs, [])
    |> validate_required([])
  end
end
