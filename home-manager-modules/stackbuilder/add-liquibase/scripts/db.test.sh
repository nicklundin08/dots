#!/usr/bin/env sh

PGPASSWORD=${PG_PASS} psql \
	-U ${PG_USER} \
	-h ${PG_HOST} \
	-d 'postgres' \
	-c 'SELECT 1'
