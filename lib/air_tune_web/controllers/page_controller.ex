defmodule AirTuneWeb.PageController do
  use AirTuneWeb, :controller

  import Ecto.Query
  alias AirTune.Radio.Station

  @repo AirTune.Repo

  def index(conn, _params) do
    query = from s in Station,
      select: %{name: s.name, homepage: s.homepage, clickcount: s.clickcount},
      order_by: [desc: :clickcount],
      limit: 10
    stations = @repo.all(query)
    IO.inspect("STACKs")
    render(conn, "index.html", stations: stations)
  end
end
