#!/bin/bash -x
source ../000_pwgen.sh

POD_NAME=$(kubectl -n matrix get pod -l k8s-app=postgres -o name)

PGSQLPW="$(pwgen|tr -d ':@/')"

echo -e "$PGSQLPW\n$PGSQLPW\n" | kubectl -n matrix exec -it $POD_NAME -- /usr/bin/createuser --pwprompt gc-bridge -U matrix
kubectl -n matrix exec -it $POD_NAME -- /usr/bin/createdb --encoding=UTF8 --locale=C --template=template0 --owner=gc-bridge gc-bridge -U matrix
