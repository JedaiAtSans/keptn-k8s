#!/bin/bash

KEPTN_VERSION=1.15.1
KUBERNETES_VERSION=1.21.14

sudo yum update -y
sudo yum install git -y
sudo yum install curl -y
sudo yum install jq -y
sudo yum install tree -y
sudo wget https://github.com/mikefarah/yq/releases/download/v4.2.0/yq_linux_amd64 -O /usr/bin/yq && sudo chmod +x /usr/bin/yq
# Install Docker

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Docker Postinstall
sudo groupadd docker
newgrp docker 
docker run hello-world
# Install kubecetl
curl -LO https://dl.k8s.io/release/v$KUBERNETES_VERSION/bin/linux/amd64/kubectl

# Install k3s
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v$KUBERNETES_VERSION+k3s1 K3S_KUBECONFIG_MODE="644" sh -s - --no-deploy=traefik

curl -sL https://get.keptn.sh | KEPTN_VERSION=$KEPTN_VERSION bash

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.12.1 sh -

keptn install --endpoint-service-type=ClusterIP --use-case=continuous-delivery
