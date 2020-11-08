defmodule AirTune.Radio.Station do
  @moduledoc """
    The Station model.
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias AirTune.Radio.{ Tag, Language, Country }

  schema "stations" do
    field :name, :string
    field :url, :string
    field :url_resolved, :string, default: ""
    field :homepage, :string
    field :favicon, :string
    field :state, :string
    field :votes, :integer
    field :codec, :string
    field :bitrate, :integer
    field :hls, :integer
    field :clickcount, :integer
    field :clicktrend, :integer

    belongs_to :language, Language, foreign_key: :language_id
    belongs_to :country, Country, foreign_key: :country_id

    many_to_many :tags, Tag, join_through: "stations_tags"

    timestamps()
  end

  def changeset(station, params \\ %{}) do
    station
    |>cast(params, [
      :name,
      :url,
      :url_resolved,
      :homepage,
      :favicon,
      :state,
      :votes,
      :codec,
      :bitrate,
      :hls,
      :clickcount,
      :clicktrend,
      :language_id,
      :country_id
    ])
    |> validate_required([:name, :url])
    |> validate_format(:url, ~r/^(https?|chrome):\/\/[^\s$.?#].[^\s]*$/)
    |> unique_constraint([:url], message: "URL must be unique")
  end
end
