FROM nvidia/cuda:11.8.0-base-ubuntu22.04 AS base
RUN apt update && apt install -y --no-install-recommends curl

RUN apt install -y --no-install-recommends python3 python3-pip
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/usr python3 -
COPY *.toml *.lock ./
RUN poetry config virtualenvs.create false && poetry install --only main

FROM base  AS jupyterhub
RUN poetry config virtualenvs.create false && poetry install --only jupyter
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
USER jovyan
CMD ["jupyterhub-singleuser"]

