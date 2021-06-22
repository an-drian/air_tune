defmodule AirTuneWeb.SearchController do
  use AirTuneWeb, :controller

  alias AirTune.Radio.Station

  def index(conn, _params) do
    # Station.get_stations_by_search("rock")
    render(conn, "index.html")
  end
end
