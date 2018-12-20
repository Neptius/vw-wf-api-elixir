defmodule VwWfApi.DevInfo.DevNew do
  use Ecto.Schema
  import Ecto.Changeset


  schema "dev_news" do

    timestamps()
  end

  @doc false
  def changeset(dev_new, attrs) do
    dev_new
    |> cast(attrs, [])
    |> validate_required([])
  end
end
