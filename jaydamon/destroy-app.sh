#!/bin/bash

res="${1:-0}";

kubectl delete -f ingress.yml

kubectl delete -f app.yml

kubectl delete -f certificate.yml

kubectl delete -f ../../secrets/canister-registry-secret.yml -n jaydamon

kubectl delete -f namespace.yml

if [ $res -eq 1 ]
then
        kubectl rollout restart deployments -n jaydamon
fi

