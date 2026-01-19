#!/usr/bin/env sh

liquibase update \
	--defaults-file liquibase.properties \
	--username ${PG_USER} \
	--password ${PG_PASS} \
	--url jdbc:postgresql://${PG_HOST}:${PG_PORT}/${PG_DB}
