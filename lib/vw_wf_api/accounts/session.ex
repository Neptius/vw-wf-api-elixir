defmodule VwWfApi.Accounts.Session do
  use Ecto.Schema
  import Ecto.Changeset

  alias VwWfApi.Accounts.User

  schema "sessions" do
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [])
    |> validate_required([])
  end
end
