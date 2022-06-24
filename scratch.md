curl -LO "https://dl.k8s.io/release/v1.21.13/bin/darwin/arm64/kubectl"
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v4.4.4 bash
minikube start -p keptn --kubernetes-version=v1.21.13 \
--cpus 6 --memory 14g --disk-size 20g

k3d cluster create mykeptn --k3s-arg '--no-deploy=traefik@server:*'

habitue-motley-reader-rasp