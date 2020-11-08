defmodule AirTune.Radio.StationTag do
  @moduledoc """
    The Language model.
  """
  # alias AirTune.Radio.Station
  use Ecto.Schema
  import Ecto.Changeset

  schema "stations_tags" do
    field :tag_id, :integer
    field :station_id, :integer
  end

  def changeset(stations_tags, params \\ %{}) do
    stations_tags
    |>cast(params, [:tag_id, :station_id])
    |> validate_required([:station_id, :tag_id])
  end
end
