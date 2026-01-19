#!/usr/bin/env sh

##################################################
# !!! WARNING - very destructive!!! Drops the DB
##################################################

PGPASSWORD=${PG_PASS} psql \
	-U ${PG_USER} \
	-h ${PG_HOST}  \
	-d 'postgres'  \
	-c "DROP DATABASE ${PG_DB}" || true
