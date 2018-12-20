defmodule VwWfApi.Repo.Migrations.CreateDevNewsTag do
  use Ecto.Migration

  def change do
    create table(:dev_news_tag) do

      timestamps()
    end

  end
end
