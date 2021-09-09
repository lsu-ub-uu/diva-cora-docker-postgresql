ARG CORA_DOCKER_VERSION
FROM cora-docker-postgresql:${CORA_DOCKER_VERSION}

USER root

RUN mkdir data

COPY sql/tables/* sql/tables/
COPY sql/data/* sql/data/
COPY initdb/*.sh docker-entrypoint-initdb.d/

RUN chmod +rx docker-entrypoint-initdb.d/*.sh && chown -R postgres: sql

USER postgres