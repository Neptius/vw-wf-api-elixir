defmodule VwWfApi.Repo.Migrations.CreateDevNewsTag do
  use Ecto.Migration

  def change do
    create table(:dev_new_tags) do
      add :name, :string
      add :color, :string

      timestamps()
    end

  end
end
