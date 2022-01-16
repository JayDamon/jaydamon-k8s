#!/bin/bash

echo "Destroying app in env jd-mm"

kubectl delete -f ingress.yml

kubectl delete -f moneymaker-app.yml -n jd-mm

kubectl delete -f rabbit-config.yml

kubectl delete -f app-config.yml

kubectl delete -f config-map.yml

kubectl delete -f ../../secrets/moneymaker-app-secrets.yml -n jd-mm

kubectl delete -f ../../secrets/canister-registry-secret.yml -n jd-mm

kubectl delete -f cert.yml

kubectl delete -f namespace.yml