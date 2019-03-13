defmodule VwWfApi.Repo.Migrations.CreateDevNews do
  use Ecto.Migration

  def change do
    create table(:dev_news) do
      add :content, :string
      add :tag_id, references(:dev_new_tags)

      timestamps()
    end

  end
end
