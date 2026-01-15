(changelog)=
# Changelog

(changelog-upcoming)=
## Upcoming changes


(changelog-2026-01-15)=
## 2026-01-15

(changelog-eol-redirects)=
### Termination of redirects from `*.hub.zamg.ac.at` to `*.hub.geosphere.at` has taken effect

Redirects from `hub.zamg.ac.at` and all its subdomains to `hub.geosphere.at` has ended 2026-01-15. Requests to `hub.zamg.ac.at` result in a 404 Not Found.

If your URL still contains `hub.zamg.ac.at`, make sure to change it to `hub.geosphere.at` by 2025-12-31. All other parts of the URL should be unaffected.

Examples:\
`https://data.hub.zamg.ac.at` -> `https://data.hub.geosphere.at`\
`https://dataset.api.hub.zamg.ac.at` -> `https://dataset.api.hub.geosphere.at`\
`https://dataset.api.hub.zamg.ac.at/v1/grid/historical/inca-v1-1h-1km/metadata` ->\
`https://dataset.api.hub.geosphere.at/v1/grid/historical/inca-v1-1h-1km/metadata`

No action is required if you are using `hub.geosphere.at` already.

(changelog-2025-06-05)=
## 2025-06-05

### code-list support

Parameter metadata now supports code-lists with an optional `code_list_ref` field (as part of a parameter metadata). 
Available code-lists are gathered in a `code_lists` dictionary in the metadata body. 

e.g.: 

```
# metadata body
{
  # ...
  "parameters": [
   #...
   {
      "name": "rrm",
      "long_name": "Niederschlagsdauer",
      "description": "Niederschlagsdauer, berechnet aus 1-Minuten-Niederschlagsmelder-Daten",
      "unit": "min",
      "code_list_ref": "c1"
   },
   {
      "name": "zeitx_flag",
      "long_name": "Qualitätsflag für Zeitpunkt der maximalen Windgeschwindigkeit (Spitzenböe)",
      "description": "Qualitätsflag für Zeitpunkt der maximalen Windgeschwindigkeit (Spitzenböe) in 10m Höhe, 10-Minuten-Wert",
      "unit": "code",
      "code_list_ref": "q21"
    }
  ],
  "code_lists": {
    "c1": [
      {
        "key": 0,
        "value": "kein Niederschlag gemessen"
      },
      {
        "key": 1,
        "value": "Niederschlag gemessen"
      }
    ],
    "q21": [
      {
        "key": null,
        "value": "undefiniert"
      },
      {
        "key": 0,
        "value": "ungeprüfte Daten"
      },
      {
        "key": 10,
        "value": "automatisch geprüft"
      },
      {
        "key": 11,
        "value": "automatisch geprüft (verändert)"
      },
      {
        "key": 12,
        "value": "automatisch geprüft (original)"
      },
      {
        "key": 20,
        "value": "manuell geprüft (unbekannt)"
      },
      {
        "key": 21,
        "value": "manuell geprüft (verändert)"
      },
      {
        "key": 22,
        "value": "manuell geprüft (original)"
      }
    ]
  },
 #...
}
```
:::{tip}
only `klima-v2-*` datasets offer support for code-lists at this moment.
:::

(changelog-2025-03-26)=
## 2025-03-26

### klima-v2-1y

A new dataset for yearly weather station data is released: `klima-v2-1y`.


(changelog-2025-01-22)=
## 2025-01-22

### chem-v2 replacing chem-v1

Released updated datasets of the chemical forecast model (`chem-v2-1h-3km` and `chem-v2-1h-9km`) replacing the `chem-v1` datasets:

- `chem-v1-1h-4km` is replaced with `chem-v2-1h-3km`
- `chem-v1-1h-12km` is replaced with `chem-v2-1h-9km`.

__The `chem-v1` datasets no longer receive data updates and are marked as `legacy` and will be removed in a future release.__

There are a few changes to the chemical forecast model:
- The spatial resolution has increased. The chemical forecast for Europe now is in 9x9km resolution (formerly 12x12km) and the chemical forecast for Central Europe is in 3x3km resolution (formerly 4x4km).
- The center coordinate has shifted.
- The bounding box has changed.


(changelog-2024-09-02)=
## 2024-09-02
* _klima-v1_ resources (`klima-v1-10min`, `klima-v1-1h`, `klima-v1-1d` and `klima-v1-1m`) stop receiving data updates. The resource can still be requested but no data past `2024-09-02` is available.

Please use the corresponding _klima-v2_ resources instead.

(changelog-2024-05-07)=
## 2024-05-07

* Added a new forecast dataset: `ensemble-v1-1h-2500m`. See the {{"[description of the dataset on our data portal]({}/dataset/ensemble-v1-1h-2500m)".format(DATA_PORTAL_URL)}}.

(changelog-2024-04-03)=
## 2024-04-03

### klima-v2

* Fixed internal server error when requesting data that is outside of stations valid date range, see [#27](https://github.com/Geosphere-Austria/dataset-api-docs/issues/27).

### Documentation

* Added [request rate limit](request_rate_limit) information.
* Updated the [parameter mapping table](_static/documents/klima-v2-1m.csv) for monthly klima data.

(changelog-20240222)=
## 2024-02-22

### klima-v2

We released a set of four new datasets, that supersede the `klima-v1` datasets:
* `klima-v1-10min` -> `klima-v2-10min`
* `klima-v1-1h` -> `klima-v2-1h`
* `klima-v1-1d` -> `klima-v2-1d`
* `klima-v1-1m` -> `klima-v2-1m`

:::{warning}
We advise you to switch your data queries to the new datasets in time. We will stop updating `klima-v1` in the future.
:::

#### New features

The new datasets bring a few improvements over the old `klima-v1` datasets:
* **Faster updates.** We now process each station individually and data is available, as soon as it is checked, instead of releasing in batches once per day.
* **More stations.** Almost 100 stations (current and historic) have been added.
* **Faster requests.** We improved data storage and retrieval. As a result `klima-v2` should serve data
  faster than `klima-v1` endpoints.

#### Backwards incompatible changes
* **Parameter names have changed.** As part of a standardization process of parameter names among multiple datasets, parameter names were adjusted. You can find a mapping of the old parameter names to the new ones below:
  * [klima-v2-10min.csv](_static/documents/klima-v2-10min.csv)
  * [klima-v2-1h.csv](_static/documents/klima-v2-1h.csv)
  * [klima-v2-1d.csv](_static/documents/klima-v2-1d.csv)
  * [klima-v2-1m.csv](_static/documents/klima-v2-1m.csv)
* **Do not treat `end_time` as a reliable source for the last update time.** In `klima-v1` data was only updated once a day and the delayed ingestion, made `end_time` a quite reliable indicator for available data.
  Since we now update datasets continuously and process each station individually, there can be quite some difference between `end_time` and the station(s) you are interested in. 


### tawes-v1-10min

In accordance with the changes above, we also added more stations to the `tawes-v1-10min` dataset.

:::{note}
In some cases, there may be stations that are only available via `tawes-v1-10min` and not in `klima-v2-10min`. 
This can be an indicator, that these stations are very new and/or are temporary weather stations. 
**Please note that temporary stations could be removed from the dataset without announcement!**
:::

### Docs changes

* Added explanation for the availability of historic forecasts
* Added explanation on how to pass arrays to our API


(changelog-20240115)=
## 2024-01-15

* Released two new forecast datasets:
  * `chem-v1-1h-4km`: Chemical weather prediction for Central Europe
  * `chem-v1-1h-12km`: Chemical weather prediction for Europe

(changelog-20231214)=
## 2023-12-14

* Add BBOX format to description for grid queries [#19](https://github.com/Geosphere-Austria/dataset-api-docs/issues/19)
* Fix mistyped projection `EPSG:4325` to `EPSG:4326`.
* Remove verified information from resource list, see [#20](https://github.com/Geosphere-Austria/dataset-api-docs/issues/20).


(changelog-20231116)=
## 2023-11-16
* Released an initial version of forecast endpoints
* Forecasts: Added nowcasting dataset `nowcast-v1-15min-1km`.
* Forecasts: Added numerical weather prediction dataset `nwp-v1-1h-2500m`.

```{note}
Forecasts are available in `prerelease` stability. This feature is still 
under active development and subject to non-backwards compatible changes.
Make sure you follow updates on the changelog and give us feedback on the endpoints on [https://github.com/Geosphere-Austria/dataset-api-docs](https://github.com/Geosphere-Austria/dataset-api-docs)  
```


(changelog-20230918)=
## 2023-09-18

### Redirecting requests to {{"[{}]({})".format(BASE_URL, BASE_URL)}}

Requests to {{"`{}`".format(LEGACY_BASE_URL)}} are now forwarded to {{"`{}`".format(BASE_URL)}} with a HTTP 301 redirect.
Make sure to update your code, to point to the new domain.
Check this changelog or the [Github Repository](https://github.com/Geosphere-Austria/dataset-api-docs) for updates regarding end-of-life
of this redirect.

```{attention}
Use the URL {{"[{}]({})".format(BASE_URL, BASE_URL)}} for all API calls in new and existing projects.
```

(changelog-20230907)=
## 2023-09-07

* Fixing timeout error when requesting large geojson datasets. [#12](https://github.com/Geosphere-Austria/dataset-api-docs/issues/12)

(changelog-20230718)=
## 2023-07-18

(changelog-20230718-geosphere)=
### Release of {{"[{}]({})".format(BASE_URL, BASE_URL)}}

The API at {{"[{}]({})".format(BASE_URL, BASE_URL)}} is now live. This means:

* New features will only be released to {{"[{}]({})".format(BASE_URL, BASE_URL)}}
* the API under the URL
{{"[{}]({})".format(LEGACY_BASE_URL, LEGACY_BASE_URL)}} is deprecated and will only receive maintenance releases before 
the address is redirected to {{"[{}]({})".format(BASE_URL, BASE_URL)}} approximately in September.

**We therefore strongly recommend to use the new URL {{"[{}]({})".format(BASE_URL, BASE_URL)}} for new applications and update existing ones**.
Your requests should not require any further changes since the endpoints are otherwise the same.

### Updated dataset API documentation

The user documentation has been overhauled. The source code for the documentation is available at
[https://github.com/Geosphere-Austria/dataset-api-docs](https://github.com/Geosphere-Austria/dataset-api-docs).

## 2023-06-27

* __Features__
  * Adding `snowgrid_cl-v2-1d-1km` dataset
  * Adding `spartacus-v2-1d-1km` dataset
  * Adding `spartacus-v2-1m-1km` dataset
  * Adding `spartacus-v2-1q-1km` dataset
  * Adding `spartacus-v2-1y-1km` dataset
  * Adding `winfore-v2-1d-1km` dataset

## 2022-12-14

* __Breaking__
    * Removed `lat` and `lon` parameters in favor of `lat_lon`.
    * All timestamps returned from the API are changed from second to minute resolution,
      i.e. `YYYY-MM-DDThh:mm+hh:mm`. This may break parsers that rely on second
      resolution.

* __Features__
    * Adding `histalp-v1-1y` endpoint.

* __Enhancements__
    * Introducing `lat_lon` parameter for type *timeseries*.
    * Multiple coordinate pairs can be requested from *timeseries* data using the 
      `lat_lon` parameters.
    * Introducing `bboxOuter` metadata for grid type data. `bboxOuter` defines the 
      `bbox` parameter values limits.

* __Fixes__
    * Fixing error when requesting data from more than one station with a station having
      no data for the requested time.
    * Fixing missing time steps when requesting data from more than one station all not
      having any data for this time period.
    * Updated outdated station metadata.
    * Fixed no timezone in CSV files.

## 2022-03-03

* API first release.