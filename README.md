# api-docs

> :exclamation: The Geosphere Austria data API will move to https://dataset.api.geosphere.at.
> The API is still available at https://dataset.api.hub.zamg.ac.at but will be redirected
> to the new address in the near future.  We recommend to follow redirects and use the host
> https://dataset.api.geosphere.at when it is published. For more details see
> https://dataset.api.hub.zamg.ac.at/v1/docs/changelog.html#bevorstehend.

This is the documentation for [data-api](https://dataset.api.hub.geosphere.at/v1) 
provided by [Geosphere Austria](https://geosphere.at).

The documentation is written in [Sphinx](https://www.sphinx-doc.org/en/master/) together
with [MyST Markdown](https://www.sphinx-doc.org/en/master/usage/markdown.html) as a 
markup language.

The source code for the documentation is located in the [src/](src/) folder. The 
documentation build will be located in the `build/` folder.

## Usage

Create a python environment

    make python-venv

Build the docs

    make api-docs

If you want to start a server which builds and reloads the docs automatically upon 
changes in the source files run

    make auto-reload-server

The documentation will be available at http://localhost:8000
