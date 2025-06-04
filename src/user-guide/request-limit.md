(request_limit)=
# Request Limit

Requests are limited at the rate at which requests can be sent and in the size of the data is requested.

(request_rate_limit)=
## Request Rate Limit

A users requests are limited to `5 requests per second` and `240 requests per hour`.

You can also check the response header for the rate limit, the remaining number of requests until that limit is hit and the duration until the rate limit is reset:

* `x-ratelimit-limit-hour` the hourly rate limit,
* `x-ratelimit-limit-second` the rate limit per second,
* `x-ratelimit-remaining-second` the remaining requests per second
* `x-ratelimit-remaining-hour` the remaining requests per hour,
* `ratelimit-reset` seconds until the rate limit is reset.

The server responses with status code 429 when the rate limit is exceeded.

(request_size_limit)=
## Request Size Limit

A request size limit is enforced. When the request format is `JSON` or `CSV` the limit is {{JSON_LIMIT}} values, when
requesting NetCDF files the limit is {{FILE_LIMIT}} values.

The request size is calculated by `# parameters` * `# time steps` *  `# locations`.

__Examples__

* Given a data source with 15 minute temporal resolution the request for 2 parameters for a 6-hour interval from 3 
stations will result in a request size of 
    ```
    2 * (6 * 4) * 3 = 144
    ```

* Given a data source with 1 hour temporal resolution and 1 by 1 km spatial resolution the request for 12 parameters
for a 24-hour interval on a 6 * 8 km grid results in a request size of 

    ```
    12 * 24 * (6 * 8) = 13824
    ```

:::{note}
The request size is calculated before the request is processed. 
:::

Because the request size is calculated before the request is processed missing values are included in the calculation
count. Therefore, a request may hit the request size limit even if no values for the requested range exist. For example 
the request 
`v1/station/historical/tawes-v1-10min?station_ids=11072&parameters=TL&parameters=TLMIN&parameters=TLMAX&start=1990-01-01&end=2000-01-01` 
requesting multiple parameters for the 1990s for TAWES station `11072` (*Neusiedl am See*) will say the request is to big
even if the station only went into service in 2016.
