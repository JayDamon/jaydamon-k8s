kubectl apply -f namespace.yml

kubectl apply -f certificate.yml

kubectl apply -f app.yml

kubectl apply -f ingress.yml

kubectl rollout restart deployments -n jaydamon