#!/bin/bash -x

bridge=discord

install -d $(pwd)/configgen
docker run --env UID=$(id -u) --env GID=$(id -g) --rm -v `pwd`/configgen:/data:z dock.mau.dev/mautrix/$bridge:latest
