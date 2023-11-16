(modes)=
# Modes

```{tip}
If you prefer to use Swagger to understand the API capabilities, see {{"[OpenAPI docs]({})".format(API_OPENAPI_DOCS)}}.
```

## historical

Historical data. This can be past measurements from a weather station or model data for some point in the past.

## current

The current calculation/measurement depending on type.

## forecast

```{note}
Forecasts are available in `prerelease` stability. This feature is still 
under active development and subject to non-backwards compatible changes.
Make sure you follow updates on the changelog and give us feedback on the endpoints on [https://github.com/Geosphere-Austria/dataset-api-docs](https://github.com/Geosphere-Austria/dataset-api-docs)  
```

Forecast data. This is the output of one or multiple models for some point in the future.

Forecasts have several additional metadata attributes (available via the `/metadata` endpoint of the respective data source):
* `available_forecast_reftimes` holds all available forecast reference times. The _forecast reference time_ describes when the data was created, i.e. the forecast model was run.
* `last_forecast_reftime` holds the newest available forecast reference time.
* `max_forecast_offset` is the maximum allowed value for the `forecast_offset` parameter.
* `forecast_length` describes how many time steps a single forecast has.

```{note}
Currently, the available forecast duration (timerange covered by a forecast) is always `forecast_length * freq` for easier use.
In the future, this may change, so this simple formula does not necessarily hold. For example a dataset
might have `1H` timesteps for the next 6 hours, `3H` steps for the following 18 hours, and even lower resolutions after that.
When available, this information will be displayed as part of the metadata of a dataset.
```


## mode specific parameters

:::{glossary}
start
    if `mode` is _historical_ or _forecast_

    The start date and time, supplied in `YYYY-MM-DDThh:mm` format (the time is optional).

    In case of forecasts `start` is optional and defaults to the last forecast timestamp before now.

end
    if `mode` is _historical_ or _forecast_

    The end date and time, supplied in `YYYY-MM-DDThh:mm` format (the time is optional).

    In case of forecasts `end` is optional and defaults to the end of the forecast.


forecast_offset
    if `mode` is _forecast_

    An optional _offset_ allowing you to select an older forecast. `forecast_offset` counts backwards, so `0` is the most recent forecast, `1` the second most recent and so on.
    You can check the `available_forecast_reftimes` metadata attribute, and the offset will correspond to the index of the list.

    The default value is `0`, i.e. the most recently produced forecast is requested, and must be between `0` and `max_forecast_offset`.
:::


