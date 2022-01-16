#!/bin/bash

kubectl apply -f namespaces.yml

kubectl apply -f ../../kubernetes-secrets/moneymaker-app-secrets.yml -n jd-mm

kubectl apply -f config-map.yml

kubectl apply -f app-configs.yml

kubectl apply -f certificates.yml

kubectl apply -f deployments.yml

kubectl apply -f ingress.yml

kubectl rollout restart deployments -n jd-mm

#!/bin/bash

res="${1:-0}";

echo "Launching app in env jd-mm"

kubectl apply -f namespace.yml

kubectl apply -f cert.yml

kubectl apply -f ../../secrets/canister-registry-secret.yml -n jd-mm

kubectl apply -f ../../secrets/moneymaker-secrets-jd-mm.yml

kubectl apply -f config-map.yml

kubectl apply -f app-config.yml

kubectl apply -f rabbit-config.yml

kubectl apply -f moneymaker-app.yml -n jd-mm

kubectl apply -f ingress.yml

if [ $res -eq 1 ]
then
	kubectl rollout restart deployments -n jd-mm
fi