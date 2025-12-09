#!/bin/bash
set -e
set -x

test -d /cm
test -d /data

cp /cm/registration.yaml /data/
SECRETS_FILE=
test -f /cm/secrets.yaml && SECRETS_FILE=/cm/secrets.yaml
yq eval-all '. as $item ireduce ({}; . * $item )' /cm/config.yaml $SECRETS_FILE >/data/config.yaml
