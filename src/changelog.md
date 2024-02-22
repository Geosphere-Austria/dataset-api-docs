(changelog)=
# Changelog


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

Together with the new stations above, there are also some new real-time stations.

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

Requests to {{"`{}`".format(LEGACY_BASE_URL)}} are now fowarded to {{"`{}`".format(BASE_URL)}} with a HTTP 301 redirect.
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