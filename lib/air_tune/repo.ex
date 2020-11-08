defmodule AirTune.Repo do
  use Ecto.Repo,
    otp_app: :air_tune,
    adapter: Ecto.Adapters.Postgres
end
