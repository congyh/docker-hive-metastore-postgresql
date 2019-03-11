# Usage:
# docker image build --build-arg HIVE_VERSION=<version> -t congyh/hive-metastore-postgresql:<version> .
# docker image push congyh/hive-metastore-postgresql:<version>
FROM postgres:9.5.3

ARG HIVE_VERSION

MAINTAINER "Ivan Ermilov <ivan.s.ermilov@gmail.com>"

ADD https://github.com/apache/hive/blob/master/metastore/scripts/upgrade/postgres/hive-schema-${HIVE_VERSION}.postgres.sql /hive/hive-schema-${HIVE_VERSION}.postgres.sql
ADD https://github.com/apache/hive/blob/master/metastore/scripts/upgrade/postgres/hive-txn-schema-${HIVE_VERSION}.postgres.sql /hive/hive-txn-schema-${HIVE_VERSION}.postgres.sql

ADD init-hive-db-${HIVE_VERSION}.sh /docker-entrypoint-initdb.d/init-user-db.sh