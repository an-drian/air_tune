defmodule AirTune.Radio.Country do
  @moduledoc """
    The Country model.
  """
  alias AirTune.Radio.Station
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :name, :string
    has_many :stations, Station
  end

  def changeset(county, params \\ %{}) do
    county
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint([:name])
  end
end
