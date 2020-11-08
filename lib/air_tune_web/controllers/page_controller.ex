defmodule AirTuneWeb.PageController do
  use AirTuneWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
