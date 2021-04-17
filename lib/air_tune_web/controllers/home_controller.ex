defmodule AirTuneWeb.HomeController do
  use AirTuneWeb, :controller

  alias AirTune.Radio.Station

  def index(conn, _params) do
    stations = Station.get_popular_stations()
    IO.inspect(stations)

    render(conn, "index.html", stations: stations)
  end

  def search do

  end
end

# SELECT *
# FROM stations
# INNER JOIN stations_tags st on stations.id = st.station_id
# INNER JOIN tags t on t.id = st.tag_id
# WHERE t.name LIKE '%rock%' OR stations.name LIKE '%rock%';
