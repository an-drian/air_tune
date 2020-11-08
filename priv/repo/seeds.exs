# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AirTune.Repo.insert!(%AirTune.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
import Ecto.Query
alias AirTune.Repo
alias AirTune.Radio.{ Language, Tag, Country, Station, StationTag }


defmodule Seeds do
  def get_json(path) do
    json = with {:ok, body} <- File.read(path),
                {:ok, json} <- Jason.decode(body, keys: :atoms) do
        json
    else
      err ->
        IO.inspect("ERROR")
        IO.inspect(err)
    end
    json
  end

  def run(path, insert) do
   Enum.each(Seeds.get_json(path), fn item -> insert.(item) end)
  end
end


defmodule Seeds.Languages do
  def insert(item) do
    Repo.insert! %Language {
      name: item.name
    }
  end
end

defmodule Seeds.Tags do
  def insert(item) do
    Repo.insert! %Tag {
      name: item.name
    }
  end
end

defmodule Seeds.Countries do
  def insert(item) do
    Repo.insert! %Country {
      name: item.name
    }
  end
end

defmodule Seeds.Stations do
  def insert(item) do
    station = Repo.insert! %Station {
      name: item.name,
      url: item.url,
      url_resolved: item.url_resolved,
      homepage: item.homepage,
      favicon: item.favicon,
      state: item.state,
      votes: item.votes,
      codec: item.codec,
      bitrate: item.bitrate,
      hls: item.hls,
      clickcount: item.clickcount,
      clicktrend: item.clicktrend,
      country_id: get_country_id(item.country),
      language_id: get_language_id(item.language)
    }

    IO.inspect({ get_country_id(item.country), get_language_id(item.language) })

    tags_list = item.tags |> String.split(",")

    Tag
    |> where([t], t.name in ^tags_list)
    |> Repo.all
    |> Enum.each(fn tag -> Seeds.StationTag.insert(tag.id, station.id) end)

  end

  defp get_country_id(country_name) do
    Country |> Repo.get_by(name: country_name) |> maybe_get_id
  end

  defp get_language_id(language) do
    Language |> Repo.get_by(name: language) |> maybe_get_id
  end

  defp maybe_get_id(nil), do: nil

  defp maybe_get_id(collection) do
    collection.id
  end
end

defmodule Seeds.StationTag do
  def insert(tag_id, station_id) do
    Repo.insert! %StationTag {
      tag_id: tag_id,
      station_id: station_id
    }
  end
end

# Seeds.run("#{__DIR__}/seeds/lang.json", &Seeds.Languages.insert/1)
# Seeds.run("#{__DIR__}/seeds/tags.json", &Seeds.Tags.insert/1)
# Seeds.run("#{__DIR__}/seeds/countries.json", &Seeds.Countries.insert/1)
Seeds.run("#{__DIR__}/seeds/stations.json", &Seeds.Stations.insert/1)
Seeds.run("#{__DIR__}/seeds/stations2.json", &Seeds.Stations.insert/1)
