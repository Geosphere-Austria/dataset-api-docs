# Changelog

## 2023-02-28

- Updated doc

## 14.12.2022

### Breaking Changes

- Timestamps in den zurückgelieferten Daten wurden auf Minuten-Auflösung reduziert (`YYYY-MM-DDThh:mm+hh:mm`).
  Automatische Erkennung von ISO 8601 kompatiblen Daten sollte bei der Umstellung keine haben. Falls Sekunden explizit
  spezifiziert wurden muss das Format angepasst werden.
- Der Koordinaten-Parameter `lat_lon` ersetzt die Parameter `lat` und `lon` für Zeitreihen. Die Eingabe mehrerer
  Koordinatenpaare ist nun möglich, z.B.: `&lat_lon=48,12&lat_lon=48.5,11.3`.

### Verbesserungen

- Hinzufügen von detaillierteren Metadaten bei Gitterdatensätzen, beispielsweise `bboxOuter`, die Bounding Box die
  definiert in welchem Bereich Gitterpunkt abgefragt werden dürfen.

### Bug Fixes

- Behebung eines Fehlers der auftrat, wenn bei einer Abfrage von "kombinierten Stationen" eine der Teilstationen im
  abgefragten Zeitraum keine Daten lieferte.
- Bei der Abfrage von "kombinierten Stationen" fehlten Zeitschritte des Abfragezeitraums, falls keine der Teilstationen
  diese Daten erfasste. Die Zeitschritte werden jetzt korrekt aufgenommen (mit einem fehlenden Wert).
- Metadaten für Stationsdaten im GeoJSON-Format enthielten teilweise veraltete Beschreibungen.
- Zeitzoneninformation wurde nur in GeoJSON, nicht im CSV ausgegeben.

### Datensätze

- Der Datensatz `histalp-v1-1y` (nur österreichische Stationen) wurde hinzugefügt.,

## 03.03.2022

Release der ersten Version der API.
