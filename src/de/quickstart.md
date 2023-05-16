# Schnellstart Leitfaden

Um mit der API starten zu können wird nicht viel benötigt, öffentliche Datensätze können sogar ohne Account abgefragt
werden.

Die erste Abfrage zeigt uns die Temperatur und Niederschlag der Station "Wien - Hohe Warte" für den 24.12.2021 von 08:00
bis 09:00 in 10-minütiger Auflösung an:

[https://dataset.api.hub.zamg.ac.at/v1/station/historical/klima-v1-10min?parameters=TL,RR,RRM&start=2020-12-24T08:00&end=2020-12-24T09:00&station_ids=5904](https://dataset.api.hub.zamg.ac.at/v1/station/historical/klima-v1-10min?parameters=TL,RR,RRM&start=2020-12-24T08:00&end=2020-12-24T09:00&station_ids=5904)

```{note}
Dieses Beispiel verwendet einen Datensatz bei dem **Stationsdaten mit 10-minütiger-Auflösung** verwendet werden.
Um abzufragen welche Datensätze verfügbar sind, siehe [Verfügbare Datensätze](available_datasets).
```

```{note}
Bei unterschiedlichen zeitlichen Auflösungen sind auch unterschiedliche Parameter verfügbar. Wenn beispielsweise statistische Lageparemter
(Minimum, Maximum, Durchschnitt, etc.) von Interesse sind, sind diese bei Datensätzen mit geringerer zeitlicher Auflösung oft schon vorhanden.
Um das Temperaturmaximum einer Station am 1. Mai 2021 zu ermitteln kann beispielsweise, der Parameter `tmax` der Tagesdaten ausgelesen werden,
anstatt in den 10-Minuten-Daten alle Temperaturwerte auszulesen und das Maximum manuell zu ermitteln.
```

Zerlegen wir also die Anfrage an
`/v1/station/historical/klima-v1-10min?parameters=TL,RR,RRM&start=2020-12-24T08:00&end=2020-12-24T09:00&station_ids=5904`
in ihre Bestandteile:

**Pfad-Parameter:**

- `/v1` steht für die API Version 1 und ist derzeit die einzig verfügbare Version.
- `/station` signalisiert, dass wir Stationsdaten abfragen möchten. Innerhalb der Dokumentation wird dies auch **Typ**
  der Datensätze genannt. Es gibt drei Typen: Stationsdaten (station), Rasterdaten (grid) und Gitterpunktzeitreihen
  (timeseries). Eine genauere Beschreibung findet sich im Abschnitt [Daten](daten.md).
- `/historical` ist der **Modus** des Endpunkts. Es gibt drei unterschiedliche Modi: historische Daten (historical),
  aktuelle Daten (current) und, in Zukunft, Prognosen (forecast).
- `/klima-v1-10min` ist die eindeutige ID des Datensatzes. Diese ID ist entweder aus der Tabelle der
  [Verfügbare Datensätze](available_datasets) zu entnehmen oder über den Endpunkt `/datasets` abfragbar.

**Query-Parameter:**

- `parameters=TL,RR,RRM` gibt an welche Parameter ausgelesen werden, in unserem Fall die Lufttemperatur in 2m Höhe, der
  Niederschlag und der Niederschlagsmelder. Die verfügbaren Parameter hängen vom gewählten Datensatz ab und können über
  die API mit `/{type}/{resource_id}/{mode}/metadata` abgerufen werden, in diesem Fall also über
  [`/v1/station/historical/klima-v1-10min/metadata`](https://dataset.api.hub.zamg.ac.at/v1/station/historical/klima-v1-10min/metadata)
- `start=2020-12-24T08:00` gibt den Startzeitpunkt im [ISO 8601](https://de.wikipedia.org/wiki/ISO_8601) Format an.
- `end=2020-12-25T09:00` gibt den Endzeitpunkt im ISO 8601 Format an.
- `station_ids=5904` gibt die Stations IDs für die gewünschte Station an. Diese ist ebenfalls über
  [`/v1/station/historical/klima-v1-10min/metadata`](https://dataset.api.hub.zamg.ac.at/v1/station/historical/klima-v1-10min/metadata)
  auslesbar. Alternativ kann auch die Filtermöglichkeit des
  [Download Formulars im Datenportal](https://dataset.api.hub.zamg.ac.at/app/station-new/historical/klima-v1-10min?anonymous=true)
  genutzt werden. Mehrere Stations IDs können durch Beistrich getrennt angegeben werden, z.B. `100,200,5904`.

Das Ergebnis der obigen Abfrage sieht so aus:

```json
{
  "media_type": "application/json",
  "type": "FeatureCollection",
  "version": "v1",
  "timestamps": [
    "2020-12-24T08:00+00:00",
    "2020-12-24T08:10+00:00",
    "2020-12-24T08:20+00:00",
    "2020-12-24T08:30+00:00",
    "2020-12-24T08:40+00:00",
    "2020-12-24T08:50+00:00",
    "2020-12-24T09:00+00:00"
  ],
  "features": [
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [16.356388, 48.248611]
      },
      "properties": {
        "parameters": {
          "TL": {
            "name": "Lufttemperatur in 2m",
            "unit": "°C",
            "data": [6.8, 6.8, 6.8, 6.9, 6.9, 7.0, 7.0]
          },
          "RR": {
            "name": "Niederschlag",
            "unit": "mm",
            "data": [0.0, 0.0, 0.1, 0.1, 0.3, 0.3, 0.3]
          },
          "RRM": {
            "name": "Niederschlagsmelder",
            "unit": "min",
            "data": [4.0, 7.0, 10.0, 10.0, 10.0, 10.0, 10.0]
          }
        },
        "station": "5904"
      }
    }
  ]
}
```

Die Antwort erfolgt, wie hier, standardmäßig als [GeoJSON](https://geojson.org). Für jede abgefragte Station werden
dabei die Koordinaten der Station im Feld `coordinates` angegeben. Die abgefragten Daten in den Properties.

```{note}
Die abgefragten Daten zeigen die Lufttemperatur und den Niederschlag inkl. Niederschlagssensor.
Während die Lufttemperatur in Grad Celsisus einfach zu interpretieren ist, ist beim Niederschlag eine kurze Einführung zur
 [Interpretation von Niederschlagsdaten](precipitation_intepretation) sinnvoll.
```

## Wie geht's weiter?

Sehen Sie sich {{ '[alle Endpunkte im OpenAPI 3.0 Format]({})'.format(API_DOCS_URL) }} und die an
[Verfügbare Datensätze](available_datasets) an um weitere Daten abzufragen.
