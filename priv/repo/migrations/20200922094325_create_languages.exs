defmodule AirTune.Repo.Migrations.CreateLanguages do
  use Ecto.Migration

  def change do
    create table :languages do
      add :name, :string
    end
  end
end
