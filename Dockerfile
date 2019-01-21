FROM python:3.7-alpine

MAINTAINER José Roberto Meza cabrera <robertpro01@gmail.com>

# copy pyproject file
COPY pyproject.toml .

RUN apk --no-cache add build-base postgresql-dev

# install poetry
RUN pip --no-cache-dir install poetry poetry-setup

# We don't need a virtualenv since is Docker...
RUN poetry config settings.virtualenvs.create false

# install dependencies:
RUN poetry install

WORKDIR /app
