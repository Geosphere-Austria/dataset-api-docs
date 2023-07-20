(modes)=
# Modes

:::{tip}
If you prefer to use Swagger to understand the API capabilities, see {{"[OpenAPI docs]({})".format(API_OPENAPI_DOCS)}}.
:::

## historical

Historical data. This can be past measurements from a weather station or model data for some point in the past.

## current

The current calculation/measurement depending on type.

## mode specific parameters

:::{glossary}
start
    if _mode is historical_

    The start date and time, supplied in `YYYY-MM-DDThh:mm` format (the time is optional).

end
    if _mode is historical_

    The end date and time, supplied in `YYYY-MM-DDThh:mm` format (the time is optional).

:::

:::{tip}
If you prefer to use Swagger to understand the API capabilities, see {ref}`openapi`.
:::