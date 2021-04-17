defmodule AirTuneWeb.HomeView do
  use AirTuneWeb, :view

  def radio_favicon(""), do: "/images/no-image.jpg"

  def radio_favicon(src), do: src
end
