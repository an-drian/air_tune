defmodule AirTune.Repo.Migrations.CreateStations do
  use Ecto.Migration

  def change do
    create table :stations do
      add :name, :string
      add :url, :string
      add :url_resolved, :string
      add :homepage, :string, default: ""
      add :favicon, :string, default: ""
      add :state, :string, default: ""
      add :votes, :integer, default: 0
      add :codec, :string, default: ""
      add :bitrate, :integer, default: nil
      add :hls, :integer, default: nil
      add :clickcount, :integer, default: 0
      add :clicktrend, :integer, default: 0
      add :language_id, references(:languages), default: nil
      add :country_id, references(:countries), default: nil
    end

    create index(:stations, [:language_id, :country_id])
  end
end
