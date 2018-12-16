defmodule VwWfApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :steamid, :string
      add :personaname, :string
      add :profileurl, :string
      add :avatar, :string
      add :avatarmedium, :string
      add :avatarfull, :string

      timestamps()
    end
  end
end
