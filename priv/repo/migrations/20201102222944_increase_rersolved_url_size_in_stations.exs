defmodule AirTune.Repo.Migrations.IncreaseRersolvedUrlSizeInStations do
  use Ecto.Migration

  def up do
    alter table :stations do
      modify :url_resolved, :text
      modify :url, :text
      modify :favicon, :text
      modify :homepage, :text
    end
  end

  def down do
    alter table :stations do
      modify :url_resolved, :string
      modify :url, :string
      modify :favicon, :string
      modify :homepage, :string
    end
  end
end
