(types)=
# Types

Generally there are two types of data: *Geospatial rasters* and *station* data. 

## grid

Raster data requested by supplying a bounding box.

## timeseries

A spezial type of raster data. Instead of a supplying a bounding box an [EPSG:4325](https://epsg.io/4326) coordinate
pair is supplied. The nearest neighboring grid point from raster data is returned.

## station

This type provides measurements from weather stations.

## type specific parameters

:::{glossary}
bbox 
    if _type is grid_

    The bounding box needs to be within the limits of `bbox_outer`. Coordinates are [EPSG:4325](https://epsg.io/4326)
    encoded.

lat_lon 
    if _type is timeseries_

    Latitude and longitude coordinate pair to be queried. Coordinates are [EPSG:4325](https://epsg.io/4326) encoded. More than coordinate pair can be provided.

    Example: `lat_lon=48,12&lat_lon=48.5,11.3`

station_ids 
    if _type is station_

    The weather station id.
:::