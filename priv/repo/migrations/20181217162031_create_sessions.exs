defmodule VwWfApi.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :user_id, references(:users)

      timestamps()
    end
  end
end
