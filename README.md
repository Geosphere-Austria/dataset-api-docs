# dataset-api-docs

> :exclamation: The Geosphere Austria data API has moved to https://dataset.api.hub.geosphere.at. Redirects from `*.hub.zamg.ac.at` to `*.hub.geosphere.at` will end in December 2025.
> If you are still using the `*.hub.zamg.ac.at` you must update the URL latest by 2025-12-31. Fore more details see the [documentations changelog](https://dataset.api.hub.geosphere.at/v1/docs/changelog.html#changelog-eol-redirects

This is the [documentation](https://dataset.api.hub.geosphere.at/v1/docs) for the 
[data-api](https://dataset.api.hub.geosphere.at/v1) provided by [Geosphere Austria](https://geosphere.at).


## Feedback

If you are facing issues with the API or if you have suggestions, please open a new issue.

If your request better fits in an e-mail, please contact **datahub.support@geosphere.at**


## Build

The documentation is written in [Sphinx](https://www.sphinx-doc.org/en/master/) together
with [MyST Markdown](https://www.sphinx-doc.org/en/master/usage/markdown.html) as a 
markup language.

The source code for the documentation is located in the [src/](src/) folder. The 
documentation build will be located in the `build/` folder.

Create a python environment

    make python-venv

Build the docs

    make build

If you want to start a server which builds and reloads the docs automatically upon 
changes in the source files run

    make auto-reload-server

The documentation will be available at http://localhost:8000

### Containerized Build

You can build a container image with the documentation via

    make container-image

and run the image with

    make run-container

The containerized documentation is available at http://localhost:8000/v1/docs