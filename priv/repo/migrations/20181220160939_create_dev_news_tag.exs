defmodule VwWfApi.Repo.Migrations.CreateDevNewsTag do
  use Ecto.Migration

  def change do
    create table(:dev_news_tag) do
      add :name, :string
      add :color, :string

      timestamps()
    end

  end
end
