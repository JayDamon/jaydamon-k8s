#!/bin/bash

res="${1:-0}";

kubectl apply -f namespace.yml

kubectl apply -f ../../secrets/dockerhub-registry-secret.yml -n jaydamon

kubectl apply -f app.yml

kubectl apply -f httproute.yml

if [ $res -eq 1 ]
then
	kubectl rollout restart deployments -n jaydamon
fi
