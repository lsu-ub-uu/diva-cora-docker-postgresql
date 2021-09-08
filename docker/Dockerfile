FROM cora-docker-postgresql:9.6

USER root

RUN mkdir data
COPY data/* data/
COPY initdb/*.sh docker-entrypoint-initdb.d/
RUN chmod +rx docker-entrypoint-initdb.d/*.sh && chown -R postgres: data

USER postgres

# build
# mvn clean package

# start and stop see scripts directory