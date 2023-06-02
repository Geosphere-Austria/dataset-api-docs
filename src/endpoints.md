# Endpoint Structure

An API endpoint (with the exception of the {{"[datasets]({}/datasets)".format(API_URL)}} endpoint) consists of four
parts:

- a host
- a version
- a type
- a mode
- and a resource_id

and are put together like this

    <host>/<version>/<type>/<mode>/<resource_id>

where 
:`<url>`:
    is {{BASE_URL}}

:`<verion>`:
    is `v1`

:`<type>`: 
    is either `grid`, `timeseries` or `station`, (see {ref}`types`)

:`<mode>`:
    is either `historical`, `current` or `forecast`, (see {ref}`modes`)

:`<resource_id>`:
    is one of the the resources listed in {ref}`resources`.

:::{note}
Not for every permutation of type, mode and resource_id exists and endpoint. To see a list all endpoints visit the 
{{"[datasets]({}/datasets)".format(API_URL)}} endpoint.
:::

Since there is no variation in `<url>` and `<version>` we will further on only focus on `<type>`, `<mode>` and
`<resource_id>`.

## Examples

**Listing datasets**

{{"    {}/datasets".format(API_URL)}}

**Requesting the current air temperature form tawes stations "Hohe Warte"**

{{"    {}/station/current/tawes-v1-10min?parameters=TL&station_ids=11035".format(API_URL)}}

**Requesting metadata for the "(longtime) Apolis Dataset"**

{{"    {}/grid/historical/apolis_long-v1-1d-100m/metadata".format(API_URL)}}


## Further information

:{{"[Data Portal]({})".format(DATA_PORTAL_URL)}}:
    Graphical user interface.

:{{"[List all entpoints]({}/datasets)".format(API_URL)}}:
    API endpoint listing all available dataset endpoints. 

:{{"[FastAPI docs]({}/openapi-docs)".format(API_URL)}}:
    API endpoint documentation.
