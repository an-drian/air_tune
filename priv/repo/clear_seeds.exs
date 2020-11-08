alias AirTune.Repo
alias AirTune.Radio.{ Language, Tag, Country, Station, StationTag }

Repo.delete_all(StationTag)
Repo.delete_all(Station)
Repo.delete_all(Tag)
Repo.delete_all(Language)
Repo.delete_all(Country)
