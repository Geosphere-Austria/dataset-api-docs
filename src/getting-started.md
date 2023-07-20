(getting_started)=
# Getting Started

## Endpoint Structure

An API endpoint typically consists of:

    <host>/<version>/<type>/<mode>/<resource_id>

where 
:`<url>`:
    is {{"`{}`".format(BASE_URL)}}

:`<version>`:
    is `v1`

:`<type>`: 
    is either `grid`, `timeseries` or `station`, see {ref}`types`

:`<mode>`:
    is either `historical` or `current`, see {ref}`modes`

:`<resource_id>`:
    is one of the resources listed in {ref}`resources`.

:::{note}
Not for every permutation of type, mode and resource_id exists and endpoint.
:::

All datasets can be listed via {{"[{}]({})".format(API_DATASETS, API_DATASETS)}}.

Furthermore, all endpoints metadata can be requested by appending `/metadata`.

## Example

In this example we want to get the current air temperature from the TAWES station `WIEN/HOHE WARTE`.

From {{"[{}]({})".format(API_DATASETS, API_DATASETS)}} we know the endpoint 

{{"    {}/station/current/tawes-v1-10min".format(API_URL)}}

will provide the data.
The endpoint requires request parameters `parameters` and `station_ids`. From the metadata 

{{"    {}/station/current/tawes-v1-10min/metadata".format(API_URL)}}

we find the parameter name `TL` for air temperature and station_id `11035` for `WIEN/HOHE WARTE`. This results in:

{{"    {}/station/current/tawes-v1-10min?parameters=TL&station_ids=11035".format(API_URL)}}

:::{tip}
If you prefer to use Swagger to understand the API capabilities, see {{"[OpenAPI docs]({})".format(API_OPENAPI_DOCS)}}
:::

## Further information

: {ref}`user_guide`:
    User Guide.

:{{"[Data Portal]({})".format(DATA_PORTAL_URL)}}:
    Graphical user interface.

:{{"[List all endpoints]({})".format(API_DATASETS)}}:
    API endpoint listing all available dataset endpoints. 

:{{"[OpenAPI docs]({})".format(API_OPENAPI_DOCS)}}:
    API endpoint documentation.
