api-docs:
	sphinx-build -b html src/ build/

api-docs-auto-reload:
	sphinx-autobuild -b html --host 0.0.0.0 src/ build

clean:
	rm -r build