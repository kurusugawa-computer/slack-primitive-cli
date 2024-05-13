ifndef SOURCE_FILES
	export SOURCE_FILES:=slack_primitive_cli
endif
ifndef TEST_FILES
	export TEST_FILES:=tests
endif
.PHONY: lint format  publish init

init:
	pip install poetry --upgrade
	poetry install

format:
	poetry run ruff format ${SOURCE_FILES} ${TEST_FILES}
	poetry run ruff check ${SOURCE_FILES} ${TEST_FILES} --fix-only --exit-zero

lint:
	poetry run ruff check ${SOURCE_FILES} ${TEST_FILES}
	poetry run mypy ${SOURCE_FILES} ${TEST_FILES}


publish:
	poetry publish --build
