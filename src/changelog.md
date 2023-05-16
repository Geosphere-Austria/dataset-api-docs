(changelog)=
# Changelog

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