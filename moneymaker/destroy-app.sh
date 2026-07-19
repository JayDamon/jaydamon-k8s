#!/bin/bash

echo "Destroying app in env jd-mm"

kubectl delete -f httproute.yml

kubectl delete -f moneymaker-app.yml -n jd-mm

kubectl delete -f rbac.yml

kubectl delete -f app-config.yml

kubectl delete -f config-map.yml

kubectl delete -f ../../secrets/moneymaker-app-secrets.yml -n jd-mm

kubectl delete -f ../../secrets/dockerhub-registry-secret.yml -n jd-mm

kubectl delete -f namespace.yml