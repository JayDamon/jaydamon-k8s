#!/bin/bash

kubectl apply -f namespaces.yml

kubectl apply -f ../../kubernetes-secrets/jd-mm-app-secrets.yml

kubectl apply -f config-map.yml

kubectl apply -f app-configs.yml

kubectl apply -f certificates.yml

kubectl apply -f deployments.yml

kubectl apply -f ingress-config.yml

kubectl rollout restart deployments
