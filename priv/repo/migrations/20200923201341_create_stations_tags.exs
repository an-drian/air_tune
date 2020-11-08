defmodule AirTune.Repo.Migrations.CreateStationsTags do
  use Ecto.Migration

  def change do
    create table(:stations_tags) do
      add :station_id, references(:stations)
      add :tag_id, references(:tags)
    end

    create unique_index(:stations_tags, [:station_id, :tag_id])
  end
end
