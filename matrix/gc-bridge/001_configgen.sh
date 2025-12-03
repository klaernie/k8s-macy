#!/bin/bash -x

bridge=googlechat

install -d $(pwd)/configgen
docker run --rm -v `pwd`/configgen:/data:z dock.mau.dev/mautrix/$bridge:latest
