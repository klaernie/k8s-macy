#!/bin/bash
echo K8S_URL="$(kubectl config view --minify -o 'jsonpath={.clusters[0].cluster.server}')"
echo K8S_TOKEN=\<\<\<EOT
kubectl get secret github-auto-deploy-token -n hosted -o json
echo EOT

