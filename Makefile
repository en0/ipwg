.PHONY: help, tests, build, publish, publish-test

help:
	@echo "Targets are:"
	@echo " - tests: Run all unit tests"
	@echo " - build: Build the dist wheel"
	@echo " - publish: Build and publish the wheel to pypi"
	@echo " - publish-test: Build and publish the wheel to pypi test"

tests:
	@python -m unittest

publish: build
	@twine upload --skip-existing dist/*

publish-test: build
	@twine upload --skip-existing --repository-url https://test.pypi.org/legacy/ dist/*

build:
	@python setup.py sdist bdist_wheel