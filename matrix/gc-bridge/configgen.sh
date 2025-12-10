#!/bin/bash -x

install -d $(pwd)/configgen
podman run --rm -v `pwd`/configgen:/data:z dock.mau.dev/mautrix/googlechat:latest
