defmodule AirTune.Repo.Migrations.CreateCoutries do
  use Ecto.Migration

  def change do
    create table :countries do
      add :name, :string
    end
  end
end
