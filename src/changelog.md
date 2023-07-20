(changelog)=
# Changelog

## Upcoming

### Redirecting {{"[{}]({})".format(LEGACY_BASE_URL, LEGACY_BASE_URL)}} to {{"[{}]({})".format(BASE_URL, BASE_URL)}}

The API at {{"[{}]({})".format(BASE_URL, BASE_URL)}} is now live, see {ref}`changelog-20230718-geosphere` for further
details.

To ensure a smooth transition the API at {{"[{}]({})".format(LEGACY_BASE_URL, LEGACY_BASE_URL)}} is still available but
deprecated and will be redirected to {{"[the new URL]({})".format(BASE_URL)}} in the future.

```{attention}
The redirect is planned for September 2023. Check this changelog or the [Github Repository](https://github.com/Geosphere-Austria/dataset-api-docs) for updates.
```

```{note}
We recommend to use the new URL {{"[{}]({})".format(BASE_URL, BASE_URL)}} from now on.
```

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