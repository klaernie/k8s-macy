#!/bin/bash
HOMESERVERNAME=matrix.ak-online.be

install -d config-gen
install -d config-gen/fake-data

docker run -it --rm \
	--mount type=bind,src=$(cd $(dirname "$0"); pwd)/config-gen,dst=/config \
	--mount type=bind,src=$(cd $(dirname "$0"); pwd)/config-gen/fake-data,dst=/data \
	-e SYNAPSE_SERVER_NAME=$HOMESERVERNAME \
	-e SYNAPSE_REPORT_STATS=yes \
	-e SYNAPSE_CONFIG_DIR=/config \
	-e SYNAPSE_CONFIG_PATH=/config/homeserver.yaml \
	matrixdotorg/synapse:latest generate
