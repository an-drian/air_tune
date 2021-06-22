defmodule AirTuneWeb.HomeController do
  use AirTuneWeb, :controller

  alias AirTune.Radio.Station

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    stations = Station.get_popular_stations()
    render(conn, "index.html", stations: stations)
  end
end
