#!/bin/bash

echo "Destroying app in env jd-mm"

kubectl apply -f ingress.yml

kubectl apply -f moneymaker-app.yml -n jd-mm

kubectl apply -f rabbit-config.yml

kubectl apply -f app-config.yml

kubectl apply -f config-map.yml

kubectl apply -f ../../secrets/moneymaker-secrets-jd-mm.yml

kubectl apply -f ../../secrets/canister-registry-secret.yml -n jd-mm

kubectl apply -f cert.yml

kubectl apply -f namespace.yml