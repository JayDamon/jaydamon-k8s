#!/bin/bash

res="${1:-0}";

kubectl apply -f namespace.yml

kubectl apply -f ../../secrets/canister-registry-secret.yml -n jaydamon

kubectl apply -f certificate.yml

kubectl apply -f app.yml

kubectl apply -f ingress.yml

if [ $res -eq 1 ]
then
	kubectl rollout restart deployments -n jaydamon
fi