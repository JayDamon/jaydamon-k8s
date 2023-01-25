#!/bin/bash

res="${1:-0}";

namespace="media-jd"

echo "Launching app in env $namespace"

kubectl apply -f namespace.yml

kubectl apply -f cert.yml

kubectl apply -f ../../secrets/canister-registry-secret.yml -n $namespace

kubectl apply -f ../../secrets/media-library-secrets.yml -n $namespace

kubectl apply -f config-map.yml

kubectl apply -f app-config.yml

kubectl apply -f media-catalog-app.yml -n $namespace

kubectl apply -f ingress.yml

if [ $res -eq 1 ]
then
	kubectl rollout restart deployments -n $namespace
fi
