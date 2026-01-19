#!/usr/bin/env sh

PGPASSWORD=${PG_PASS} psql \
	-U ${PG_USER} \
	-h ${PG_HOST} \
	-d ${PG_DB} -f ../db.queries/schema.sql
