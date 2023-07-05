# api-docs

This is the documentation for [data-api](https://dataset.api.hub.geosphere.at/v1) 
provided by [Geosphere Austria](https://geosphere.at).

The documentation is written in [Sphinx](https://www.sphinx-doc.org/en/master/) together
with [MyST Markdown](https://www.sphinx-doc.org/en/master/usage/markdown.html) as a 
markup language.

The source code for the documentation is located in the [src/](src/) folder. The 
documentation is build into the [build/](build/) folder. Use the following steps

## Build API documentation

Create a python environment

    make python-venv

Build the docs

    make api-docs

If you want to start a server which builds and reloads the docs automatically upon 
changes in the source files run

    make auto-reload-server

The documentation will be available at http://localhost:8000