#!/bin/bash

namespace="media-jd"

echo "Destroying app in env $namespace"

kubectl delete -f httproute.yml

kubectl delete -f media-catalog-app.yml -n $namespace

kubectl delete -f rbac.yml

kubectl delete -f app-config.yml

kubectl delete -f config-map.yml

kubectl delete -f ../../secrets/media-library-secrets.yml -n $namespace

kubectl delete -f ../../secrets/dockerhub-registry-secret.yml -n $namespace

kubectl delete -f namespace.yml
