#!/bin/bash

kubectl -n matrix create cm gc-bridge \
	--from-file=config.yaml=configgen/config.yaml \
	--from-file=registration.yaml=configgen/registration.yaml \
	--dry-run=client \
	-o yaml > 003_configmap-temp.yaml

