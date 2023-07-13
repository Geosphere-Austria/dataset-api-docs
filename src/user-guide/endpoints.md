(endpoints)=
# Endpoints

## Endpoint structure.

% TODO: this is duplicate of overview. Keep it?

An API endpoint (with the exception of the {{"[datasets]({}/datasets)".format(API_URL)}} endpoint) consists of five
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
    is either `grid`, `timeseries` or `station`, see {ref}`types`

:`<mode>`:
    is either `historical` or `current`, see {ref}`modes`

:`<resource_id>`:
    is one of the the resources listed in {ref}`resources`.

:::{note}
The resource determines the available types and mode.
:::

For example weather stations will always have *station* type.

:::{tip}
To see a list all endpoints visit the {{"[datasets]({}/datasets)".format(API_URL)}} endpoint.
:::

:::{note}
Some API parameters are mode and type specific.
:::

## Metadata

All endpoints have __metadata__ which can be requested by appending `/metadata` to the endpoint.

Metadata contain also helpful information about the request parameters like the range of allowed values.

