.PHONY: setup
setup:
	pip install tox

.PHONY: setup-dev
setup-dev:
	pyenv install -s 3.6.15
	pyenv install -s 3.7.12
	pyenv install -s 3.8.6
	pyenv install -s 3.9.9
	pyenv install -s 3.10.0
	pyenv local 3.6.15 3.7.12 3.8.6 3.9.9 3.10.0
	pip install tox-pyenv
	python3 -m pip install tox

.PHONY: test
test:
	tox

.PHONY: fix
fix:
	tox -e isort
	tox -e black

.PHONY: build
build:
	tox -e build_wheel

.PHONY: publish
publish:
	tox -e pypi_upload

.PHONY: open-coverage
open-coverage:
	xdg-open htmlcov/index.html || open htmlcov/index.html

.PHONY: docker-compose-up
docker-compose-up:
	cd dev && make configure up

.PHONY: docker-compose-down
docker-compose-down:
	cd dev && make down clean
