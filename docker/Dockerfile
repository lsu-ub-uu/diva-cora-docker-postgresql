FROM cora-docker-postgresql:2.0-SNAPSHOT

USER root

RUN mkdir data

COPY sql/tables/* sql/tables/
COPY sql/data/* sql/data/
COPY initdb/*.sh docker-entrypoint-initdb.d/

RUN chmod +rx docker-entrypoint-initdb.d/*.sh && chown -R postgres: sql

USER postgres