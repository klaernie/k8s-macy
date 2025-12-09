#!/bin/bash -x

install -d configgen
podman run --rm -v `pwd`/configgen:/data:z dock.mau.dev/mautrix/meta:latest
