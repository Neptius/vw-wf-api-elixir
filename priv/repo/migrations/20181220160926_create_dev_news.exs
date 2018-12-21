defmodule VwWfApi.Repo.Migrations.CreateDevNews do
  use Ecto.Migration

  def change do
    create table(:dev_news) do
      add :content, :string
      add :tag_id, references(:tags)

      timestamps()
    end

  end
end
