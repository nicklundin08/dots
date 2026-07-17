#!/bin/sh
set -e
docker container rm -f dot_box || true
docker compose build dot_box
docker compose run dot_box
