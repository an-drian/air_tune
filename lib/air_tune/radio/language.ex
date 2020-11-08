defmodule AirTune.Radio.Language do
  @moduledoc """
    The Language model.
  """
  alias AirTune.Radio.Station
  use Ecto.Schema
  import Ecto.Changeset

  schema "languages" do
    field :name, :string
    has_many :stations, Station
  end

  def changeset(language, params \\ %{}) do
    language
    |>cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint([:name])
  end
end
