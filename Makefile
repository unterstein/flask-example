define USAGE
Super awesome hand-crafted build system ⚙️

Commands:
	init      Install Python dependencies with pipenv
	test      Run linters, test db migrations and tests.
	serve     Run app in dev environment.
endef

export USAGE
help:
	@echo "$$USAGE"

init:
	pip3 install pipenv
	pipenv install --dev --skip-lock

test:
	pipenv run yapf -irp flask-example tests
	pipenv run flake8 --max-line-length=120 flask-example tests
	pipenv run pytest --junitxml=pytest.xml --cov-config .coveragerc --cov flask-example --cov-report term

serve:
	FLASK_APP=hello.py pipenv run flask run
