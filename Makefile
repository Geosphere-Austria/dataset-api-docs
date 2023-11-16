PYTHON=python3
VENV=.venv
CONTAINERNAME=dataset-api-docs

.DEFAULT_GOAL:=help

.PHONY: python-venv
python-venv:  ## Create python venv and install requirements
	${PYTHON} -m venv ${VENV}
	. ${VENV}/bin/activate; \
	pip install -r requirements.txt

.PHONY: build
build:  ## Build api documentation
	. ${VENV}/bin/activate; \
	sphinx-build -b html src/ build/

.PHONY: auto-reload-server
auto-reload-server:  ## Start sphinx autobild server
	. ${VENV}/bin/activate; \
	sphinx-autobuild -b html --host localhost src/ build

.PHONY: container-image
container-image: build  ## Build a docker image with the docs.
	docker build . -t ${CONTAINERNAME}

.PHONY: run-container
run-container: container-image  ## Run a container with the docs.
	docker run -p 8000:80 ${CONTAINERNAME}

.PHONY: clean
clean:  ## Remove the build files
	rm -r build

.PHONY: help
help:  ## Print help (this output)
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage: \033[36m\033[0m\n"} /^[$$()% 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

