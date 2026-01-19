#!/usr/bin/env sh

PGPASSWORD=${PG_PASS} psql \
	-U ${PG_USER} \
	-h ${PG_HOST}  \
	-d 'postgres' \
	-c "CREATE DATABASE ${PG_DB}" || true
