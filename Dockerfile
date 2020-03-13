FROM python:3.8.1
LABEL maintainer="wakayama0215@gmail.com"

ENV POETRY_VIRTUALENVS_CREATE=false

RUN set -x && apt-get update && apt-get install -y --no-install-recommends \
      jq \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install --no-cache-dir poetry

WORKDIR /app

COPY pyproject.toml poetry.lock /app/
RUN poetry install --no-ansi --no-interaction

COPY . /app
