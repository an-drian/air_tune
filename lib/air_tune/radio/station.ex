defmodule AirTune.Radio.Station do
  @moduledoc """
    The Station model.
  """

  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias AirTune.Radio.{ Tag, Language, Country, Station }

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

  def get_popular_stations do
    statiions_query = from station in Station,
      select: %{
        name: station.name,
        homepage: station.homepage,
        clickcount: station.clickcount,
        url_resolved: station.url_resolved,
        favicon: station.favicon
      },
      order_by: [desc: :clickcount],
      limit: 9

    AirTune.Repo.all(statiions_query)
  end

  def get_stations_by_search(keyword) do
    like = "%#{keyword}%"
    query = from s in Station,
      left_join: t in assoc(s, :tags),
      select: %{
        id: s.id,
        tag_id: t.id,
        tag_name: t.name,
        name: s.name,
        url_resolved: s.url_resolved
      },
      where: ilike(s.name, ^like) or ilike(t.name, ^like),
      limit: 50

      AirTune.Repo.all(query)
  end
end

# SELECT *
# FROM stations
# INNER JOIN stations_tags st on stations.id = st.station_id
# INNER JOIN tags t on t.id = st.tag_id
# WHERE t.name LIKE '%rock%' OR stations.name LIKE '%rock%';
