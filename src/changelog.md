(changelog)=
# Changelog

## Upcoming

### Release of https://dataset.api.hub.geosphere.at

The API will move to the new host address [https://dataset.api.hub.geosphere.at](https://dataset.api.hub.geosphere.at). 
To ensure a smooth transition the [current API](https://dataset.api.hub.zamg.ac.at) will still
be hosted for some time before [https://dataset.api.hub.zamg.ac.at](https://dataset.api.hub.zamg.ac.at)
will redirected to [https://dataset.api.hub.geosphere.at](https://dataset.api.hub.geosphere.at).

We recommend to allow for following redirects and use the new host address
[https://dataset.api.hub.geosphere.at](https://dataset.api.hub.geosphere.at) as soon it is released.
The release will be announced in the Changelog and on [GitHub](https://github.com/Geosphere-Austria/dataset-api-docs).

New features will only be released to [https://dataset.api.hub.geosphere.at](https://dataset.api.hub.geosphere.at).

```{note}
Only the host address changes. Otherwise the requests stay the same.
```

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