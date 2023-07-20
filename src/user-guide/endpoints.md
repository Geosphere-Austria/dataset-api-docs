(endpoints)=
# Endpoints

:::{tip}
If you prefer to use Swagger to understand the API capabilities, see {{"[OpenAPI docs]({})".format(API_OPENAPI_DOCS)}}
:::

## Listing Datasets

All available dataset endpoints are listed in {{"[{}]({})".format(API_DATASETS, API_DATASETS)}}.

## Dataset Endpoint Structure.

An dataset endpoint consists of five parts:

- a host
- a version
- a type
- a mode
- and a resource_id

and are put together like this

    <host>/<version>/<type>/<mode>/<resource_id>

where 
:`<host>`:
    is {{"`{}`".format(BASE_URL)}}

:`<verion>`:
    is `v1`

:`<type>`: 
    is either `grid`, `timeseries` or `station`, see {ref}`types`

:`<mode>`:
    is either `historical` or `current`, see {ref}`modes`

:`<resource_id>`:
    is one of the resources listed in {ref}`resources`.

:::{note}
The host {{"`{}`".format(LEGACY_BASE_URL)}} is deprecated.
:::

:::{tip}
The resource determines the available types and mode.
:::

For example weather stations will always have the *station* type.

:::{tip}
Some API parameters are mode and type specific.
:::

## Metadata

All dataset endpoints have __metadata__ which can be requested by appending `/metadata` to the dataset endpoint.

Metadata contain amongst other helpful information about the request parameters like the range of allowed values.

