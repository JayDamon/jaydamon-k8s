#!/bin/bash

env=$1;
res="${2:-0}";

if [[ -z "$env" ]]
then
    echo "env argument not provided";
    exit 128
elif [[ "jd" = $env ]]
then
    namespace="media-$env"
else
    echo "Invalid argument provided: $env"
    exit 128
fi

echo "Launching app in env $namespace"

kubectl apply -f namespace.yml

kubectl apply -f cert.yml

kubectl apply -f ../../secrets/canister-registry-secret.yml -n $namespace

kubectl apply -f ../../secrets/media-library-secrets.yml -n $namespace

kubectl apply -f config-map.yml

kubectl apply -f app-config.yml

kubectl apply -f media-catalog-app.yml -n $namespace

kubectl apply -f ingress-config.yml

if [ $res -eq 1 ]
then
	kubectl rollout restart deployments -n $namespace
fi
