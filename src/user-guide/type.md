(types)=
# Types

:::{tip}
If you prefer to use Swagger to understand the API capabilities, see {{"[OpenAPI docs]({})".format(API_OPENAPI_DOCS)}}.
:::

Generally there are two types of data: **geospatial raster** and **station** data. 

## grid

Raster data requested by supplying a bounding box.

## timeseries

A special type of raster data. Instead of a supplying a bounding box an [EPSG:4326](https://epsg.io/4326) coordinate
pair is supplied. The nearest neighboring grid point from raster data is returned.

## station

This type provides measurements from weather stations.

## type specific parameters

:::{glossary}
bbox 
    if _type is grid_

    The bounding box needs to be within the limits of `bbox_outer`. Coordinates are [EPSG:4326](https://epsg.io/4326)
    encoded.  The bounding box is supplied in the format `south,west,north,east`, compare the bbox parameter in the {{"[OpenAPI documentation]({})".format(API_OPENAPI_DOCS+'#/grid/Historical_Grid_Data_grid_historical__resource_id__get')}}

lat_lon 
    if _type is timeseries_

    Latitude and longitude coordinate pair to be queried. Coordinates are [EPSG:4326](https://epsg.io/4326) encoded. More than coordinate pair can be provided.

    Example: `lat_lon=48,12&lat_lon=48.5,11.3`

station_ids 
    if _type is station_

    One ore more weather station ids. There are two supported formats:
    * passing as comma-separated string: `?station_ids=1,2,3`
    * passing as multiple query parameters: `?station_ids=1&station_ids=2&station_ids=3`
:::

