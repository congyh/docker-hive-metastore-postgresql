# Usage:
# docker image build --build-arg HIVE_VERSION=<version> -t congyh/hive-metastore-postgresql:<version> .
# docker image push congyh/hive-metastore-postgresql:<version>
FROM postgres:9.5.3

ARG HIVE_VERSION

MAINTAINER "Ivan Ermilov <ivan.s.ermilov@gmail.com>"

COPY hive-schema-${HIVE_VERSION}.postgres.sql /hive/hive-schema-${HIVE_VERSION}.postgres.sql
COPY hive-txn-schema-${HIVE_VERSION}.postgres.sql /hive/hive-txn-schema-${HIVE_VERSION}.postgres.sql

ADD init-hive-db-${HIVE_VERSION}.sh /docker-entrypoint-initdb.d/init-user-db.sh