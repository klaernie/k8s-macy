#!/bin/bash
set -e
set -x

test -d /cm
test -d /data

cp /cm/registration.yaml /data/
SECRETS_FILE=
test -f /cm/secrets.yaml && SECRETS_FILE=/cm/secrets.yaml
yq eval-all '. as $item ireduce ({}; . * $item )' /cm/config.yaml $SECRETS_FILE >/data/config.yaml

if [ -n "$DB_URI" ]; then
	yq -i '.appservice.database.uri = strenv(DB_URI)' /data/config.yaml
fi
if [ -n "$PUPPETTOKEN" ]; then
	yq -i '.bridge.login_shared_secret_map."ak-online.be" = strenv(PUPPETTOKEN)' /data/config.yaml
fi
