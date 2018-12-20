defmodule VwWfApi.Repo.Migrations.CreateDevNews do
  use Ecto.Migration

  def change do
    create table(:dev_news) do

      timestamps()
    end

  end
end
