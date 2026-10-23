GITLEAKS_VERSION := v8.30.1
GITLEAKS_DOCKER_CONFIG ?= /tmp/slack-primitive-cli-gitleaks-docker-config

ifndef SOURCE_FILES
	export SOURCE_FILES:=slack_primitive_cli
endif
ifndef TEST_FILES
	export TEST_FILES:=tests
endif
.PHONY: lint format  publish init

init:
	uv sync --locked

format:
	uv run ruff format ${SOURCE_FILES} ${TEST_FILES}
	uv run ruff check ${SOURCE_FILES} ${TEST_FILES} --fix-only --exit-zero

lint:
	uv run ruff check ${SOURCE_FILES} ${TEST_FILES}
	uv run mypy ${SOURCE_FILES} ${TEST_FILES}


publish:
	uv build
	uv publish

.PHONY: gitleaks

gitleaks:
	@if command -v gitleaks >/dev/null 2>&1; then \
		gitleaks git --redact=100 --verbose --log-opts=HEAD .; \
	elif command -v docker >/dev/null 2>&1; then \
		mkdir -p "${GITLEAKS_DOCKER_CONFIG}"; \
		DOCKER_CONFIG="${GITLEAKS_DOCKER_CONFIG}" docker run --rm \
			-v "$$(pwd):$$(pwd):ro" \
			-v "$$(git rev-parse --path-format=absolute --git-common-dir):$$(git rev-parse --path-format=absolute --git-common-dir):ro" \
			-w "$$(pwd)" ghcr.io/gitleaks/gitleaks:${GITLEAKS_VERSION} git --redact=100 --verbose --log-opts=HEAD .; \
	else \
		echo "gitleaksまたはdockerをインストールしてください。" >&2; \
		exit 127; \
	fi
