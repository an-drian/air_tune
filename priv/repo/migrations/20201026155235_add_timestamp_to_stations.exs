defmodule AirTune.Repo.Migrations.AddTimestampToStations do
  use Ecto.Migration

  def change do
    alter table :stations do
      timestamps()
    end
  end
end
