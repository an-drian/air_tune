defmodule AirTune.Radio.Tag do
  @moduledoc """
    The Tags model.
  """
  alias AirTune.Radio.Station
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    many_to_many :stations, Station, join_through: "stations_tags"
  end

  def changeset(tag, params \\ %{}) do
    tag
    |>cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint([:name])
  end
end
