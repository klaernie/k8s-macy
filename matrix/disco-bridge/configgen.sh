#!/bin/bash -x

install -d $(pwd)/configgen
podman run --env UID=$(id -u) --env GID=$(id -g) --rm -v `pwd`/configgen:/data:z dock.mau.dev/mautrix/discord:latest
