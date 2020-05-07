ifndef TARGET
	export TARGET:=slack_primitive_cli
endif
.PHONY: lint format  publish init

init:
	pip install poetry --upgrade
	pipenv install --dev

format:
	poetry run autoflake  --in-place --remove-all-unused-imports  --ignore-init-module-imports --recursive ${TARGET}
	poetry run black ${TARGET}
	poetry run isort --verbose --recursive ${TARGET}


lint:
	poetry run flake8 ${TARGET}

publish:
	rm -fr dist/
	pipenv run python setup.py check --strict
	pipenv run python setup.py sdist bdist_wheel
	pipenv run twine upload dist/* --repository-url https://upload.pypi.org/legacy/ --verbose
	rm -fr dist/

