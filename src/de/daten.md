# Daten

## Rasterdaten oder Stationsdaten?

Die zur Verfügung gestellten Daten lassen sich in zwei Gruppen einteilen, Rasterdaten und Stationsdaten. Rasterdaten
sind die Ergebnisse einer **Modellberechnung**, die in einem Gitter angeordnet sind. Stationsdaten dagegen sind meist
**gemessene** Daten, die bei einer Wetterstation aufgezeichnet werden. Je nach Anwendungsszenario machen daher
unterschiedliche Daten Sinn. Der Vorteil der Rasterdaten ist somit, dass solche Daten die Abschätzung einer
meteorologischen Variable abseits von Stationen ermöglichen.

## Was sind "Gitterpunktzeitreihen"?

Gitterpunktzeitreihen sind eine spezielle Abfragemöglichkeit für **Rasterdaten**. Anstatt einen ganzen Ausschnitt (BBOX)
abzufragen, wird hier nur ein einzelner Punkt an Hand von Koordinaten abgefragt. Diese Zeitreihen sind in der API unter
`timeseries` verfügbar.

Um einen geeigneten Punkt zu finden, wird der Algorithmus **nearest-neighbor** verwendet. Das bedeutet, dass jener
Gitterpunkt zurückgeliefert wird, welcher dem angefragtem Punkt am nächsten ist.

## Verfügbare Endpunkte

Welche Endpunkte verfügbar sind können Sie über den Endpunkt **{{API_URL}}/datasets** abfragen. Beispielsweise können
alle verfügbaren `stations` Datensätze **{{API_URL}}/datasets?type=station** gefiltert werden. Alternativ führt das
[Datenportal](https://data.hub.zamg.ac.at/dataset) eine Übersicht über unsere verfügbaren Datensätze. Ausserdem sind
alle Endpunkte in der API-Dokumentation **{{API_URL}}/openapi-docs** aufgeführt. Dort sind auch die Endpunkte für die
Metadaten zu den einzelnen Endpunkten aufgelistet.

Wann die ZAMG welche Datensätze zur Verfügung stellt können Sie in unserem [Zeitplan](https://data.hub.zamg.ac.at/about)
nachlesen.

(available_datasets)=

## Verfügbare Datensätze

In dieser Dokumentation und den openapi-Ressourcen wird `ressource_id` als Platzhalter für die Datensatz-ID benutzt:

| Name                              | ressource_id              | qualitätsgeprüft | Lizenz     | Datenportal-Link                                                    |
| --------------------------------- | ------------------------- | ---------------- | ---------- | ------------------------------------------------------------------- |
| APOLIS Kurzzeit täglich           | `apolis_short-v1-1d-100m` | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/apolis_short-v1-1d-100m) |
| INCA Stündlich                    | `inca-v1-1h-1km`          | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/inca-v1-1h-1km)          |
| HISTALP Jährlich (nur Österreich) | `histalp-v1-1y`           | ja               | öffentlich | nur via API                                                         |
| Messstationen Stundendaten        | `klima-v1-1h`             | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/klima-v1-1h)             |
| Messstationen Tagesdaten          | `klima-v1-1d`             | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/klima-v1-1d)             |
| Messstationen Zehnminutendaten    | `klima-v1-10min`          | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/klima-v1-10min)          |
| Messtationen Monatsdaten          | `klima-v1-1m`             | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/klima-v1-1m)             |
| Spartacus Tagesdaten              | `spartacus-v1-1d-1km`     | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/spartacus-v1-1d-1km)     |
| Spartacus Monatsdaten             | `spartacus-v1-1m-1km`     | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/spartacus-v1-1m-1km)     |
| Synopdaten                        | `synop-v1-1h`             | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/synop-v1-1h)             |
| TAWES Messtationen                | `tawes-v1-10min`          | nein             | öffentlich | nur via API                                                         |
| WINFORE                           | `winfore-v1-1d-1km`       | ja               | öffentlich | [link](https://data.hub.zamg.ac.at/dataset/winfore-v1-1d-1km)       |

## Räumliche Beschränkung beim Datendownload

In den Metadaten eines Endpunkts des typs `grid` oder `timeseries` finden sich 3 verschiedene Angaben zu den räumlichen
Grenzen eines Datensets: `bbox`, `bbox_outer` und `grid_bounds`.

### BBOX

Beispiel:

```
"bbox": [
    45.77222010581118,  # Süd
    8.098133748352293,  # West
    49.478175684609575, # Nord
    17.742270413233744  # Ost
],
```

Die Werte des Parameters `bbox` (Süd, West, Nord, Ost) werden als Lat/Lon in [EPSG:4326](https://epsg.io/4326) angegeben
und beschreiben die kleinstmöglichste Bounding-Box, welche alle Zentren der Gitterpunkte enthält.

### Outer BBOX

Beispiel:

```
"bbox_outer": [
    45.767447848465544, # Süd
    8.09080314984374,   # West
    49.48267002420558,  # Nord
    17.749536880613938  # Ost
],
```

Die Werte des Parameters `bbox_outer` (Süd, West, Nord, Ost) werden als Lat/Lon in [EPSG:4326](https://epsg.io/4326)
angegeben und beschreiben die kleinstmöglichste Bounding-Box, welche alle Zentren der Gitterpunkte inklusive deren
jeweiliger Umgebung enthält. Diese Umgebung ist ein Quadrat, bei welchem die Seitenlänge dem Abstand zwischen zwei
Gitterpunkten entspricht (diese Länge in Metern ist als Parameter `patial_resolution_m` ebenfalls in den Metadaten
enthalten). Der Datensatz kann also als ein Raster aus Quadraten interpretiert werden, wo das Zentrum jeden Quadrates
den Gitterpunkt darstellt und das Quadrat an sich die zugehörige Umgebung. Folglich ist die `bbox_outer` eine
Vergrößerung der `bbox` um `patial_resolution_m / 2` in jede Richtung. **Die `bbox_outer` gibt außerdem den Bereich an,
in welchem Punkte abgefragt werden können.**

### Grid Bounds

Beispiel:

```
"grid_bounds": [
    220000, # Süd
    20000,  # West
    620000, # Nord
    720000  # Ost
]
```

Die Werte des Paramters `grid_bounds` (Süd, West, Nord, Ost) werden als x/y in einer rasterabhängigen Projektion
angegeben. Diese Projektion wird in den Metadaten im Parameter `crs` definiert. Die `grid_bounds` definieren die
originalen Eckpunkte des Rasters und können somit zur Rekonstruktion der genauen Gitterpunkte verwendet werden.

## Limitationen beim Datendownload

Um übergroße Abfragen zu vermeiden gibt es eine Beschränkung, wie viele Daten auf einmal heruntergeladen werden können.
Die Limitierung orientiert sich an "Datenpunkten", wobei ein Datenpunkt ein konkreter Wert eines Parameters zu einem
Zeitpunkt an einem Ort ist. Diese werden entsprechend nach zeitlicher Auflösung, räumlicher Auflösung und Anzahl der
Parameter multipliziert.

### Beispiele

**Luftfeuchte und Temperatur an 2 Stationen vom 1.1.2022 12:00 - 01.01.2022 19:00 in 15-minütiger Auflösung**:

```
2 (Stationen) * 7 (Stunden) * 4 (15-Minuten-Intervall pro Stunde) * 2 (Parameter)
= 112
```

**Temperatur im 6km\*6km Gitter vom 1.1.2022 12:00 - 01.01.2022 19:00 in 15-minütiger Auflösung**:

```
6*6 (Gitter-Auflösung ist 1km*1km) * 7 (Stunden) * 4 (15 Minuten-Intervall pro Stunde) * 2 (Parameter)
= 2016
```

Die Limits für die Abfragen sind derzeit:

- {{ JSON_LIMIT }} Datenpunkte für JSON und CSV Downloads
- {{ FILE_LIMIT }} Datenpunkte für NetCDF Downloads

```{warning}
Beachten Sie, dass diese Berechnung **vor** dem Auslesen der Daten geschieht. Falls ein Zeitraum abgefragt wird für den keine
Messwerte existieren, werden diese dennoch bei der Berechnung berücksichtigt.
```

## Was sind qualitätsgeprüfte Daten?

AQUAS ist ein System zur Prüfung meteorologischer Daten. Die einzelnen Systemkomponenten sind auf eine sofortige Prüfung
eingehender Werte ausgelegt. Jeder Parameter kann für sich autonom verarbeitet werden, unabhängig von den anderen
Messgrößen einer Wetterstation.

[Weitere Informationen zur Datenprüfung](https://www.zamg.ac.at/cms/de/klima/messnetze/datenpruefung)

(precipitation_intepretation)=

## Wie sind Niederschlagsdaten zu interpretieren?

### Niederschlagsmelder

In einigen Datensätzen gibt es neben dem Niederschlag auch einen eigenen Parameter für den Niederschlagsmelder.
Niederschlag wird in 1/10mm gemessen. Bei sehr feinem und/oder kurzem Nieselregen werden manchmal allerdings weniger als
0,1mm erreicht. Der Wert für den Niederschlag ist also `0` (mm). Dennoch werden die Tropfen vom Niederschlagssensor
registriert. Siehe z.B. folgendes Beispiel:

| Zeitpunkt | Niederschlag | Niederschlagsmelder |
| --------- | ------------ | ------------------- |
| 08:00     | 0            | 4                   |
| 08:10     | 0            | 10                  |
| 08:20     | 0.2          | 10                  |

Diese Tabelle bedeutet, dass von 07:50 - 08:00 der Niederschlagsmelder `4` Minuten lang aktiv, und von 08:00 - 08:10
sogar `10` Minuten lang aktiv war, die Menge jedoch unter 1/10mm lag. Von 08:10 - 08:20 regnete es weiter und es werden
`0.2` mm Niederschlag erfasst.

## Vorhersage Daten

Bei Datensätzen des Modus' `forecast` handelt es sich um Vorhersagen. Alle Vorhersagen habe eine _reference_time_ welche
den Zeitpunkt wiedergibt an dem diese Vorhersage erstellt wurde, `timestamps` hingegen zeigen den Zeitpunkt auf den sich
ein konkreter Vorhersagewert bezieht (alle Angaben in UTC).

### Der `forecast_offset` Parameter

Eine Abfrage eines Vorhersagedatensatzes gibt üblicherweise die aktuellste Vorhersage zurück. Mittels des optionalen
`forecast_offset` Parameters ist es auch möglich auf ältere Vorhersagen zuzugreifen. Der `forecast_offset` Parameter
nimmt einen ganzzahligen Wert zwischen 0 und `max_forecast_offset` entgegen, welcher sozusagen dem Alter der Vorhersage
entspricht. 0 ist immer die aktuellste Vorhersage, 1 die Vorletzte, usw.

Der `max_forecast_offset` kann in den Metadaten (abrufbar unter `/{type}/{resource_id}/{mode}/metadata`) ausgelesen
werden. Ebenso sind in den Metadaten die `available_forecast_reftimes` ersichtlich welche die `reference_time` der
jeweiligen `forecast_offset`s anzeigt.

Wenn ein `forecast_offset` gesetzt wurde, werden die Daten aller `timestamp`s aus einer Vorhersage zurück gegeben. Wenn
jedoch kein `forecast_offset` gegeben ist werden aus der aktuellen Vorhersage nur jene Daten zurück gegeben, deren
`timestamp` in der Zukunft liegt. Somit können sich die Antworten bei `forecast_offset` gleich 0 und keinem
`forecast_offset` unterscheiden. Dies ist insbesondere dann der Fall wenn Vorhersagen seltener berechnet werden als die
Abstände zwischen den `timestamp`s.
