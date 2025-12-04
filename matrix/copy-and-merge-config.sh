#!/bin/bash
set -e
set -x

test -d /cm
test -d /data

cp /cm/registration.yaml /data/
yq eval-all '. as $item ireduce ({}; . * $item )' /cm/config.yaml /cm/secrets.yaml >/data/config.yaml
