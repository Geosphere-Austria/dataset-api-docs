# dataset-api-docs

> :exclamation: The Geosphere Austria data API has recently moved to https://dataset.api.hub.geosphere.at.
> If you still use https://dataset.api.hub.zamg.ac.at requests will be redirected. Please make sure to update these URLs to use https://dataset.api.hub.geosphere.at. For more details see
> [the documentations changelog](https://dataset.api.hub.geosphere.at/v1/docs/changelog.html).

This is the [documentation](https://dataset.api.hub.geosphere.at/v1/docs) for the 
[data-api](https://dataset.api.hub.geosphere.at/v1) provided by [Geosphere Austria](https://geosphere.at).


## Feedback

If you are facing issues with the API or if you have suggestions, please open a new issue.

If your request better fits in an e-mail, please contact **datahub.feedback@geosphere.at**


## Build

The documentation is written in [Sphinx](https://www.sphinx-doc.org/en/master/) together
with [MyST Markdown](https://www.sphinx-doc.org/en/master/usage/markdown.html) as a 
markup language.

The source code for the documentation is located in the [src/](src/) folder. The 
documentation build will be located in the `build/` folder.

Create a python environment

    make python-venv

Build the docs

    make api-docs

If you want to start a server which builds and reloads the docs automatically upon 
changes in the source files run

    make auto-reload-server

The documentation will be available at http://localhost:8000
