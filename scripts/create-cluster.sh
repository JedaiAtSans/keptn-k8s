#!/bin/zsh

# Create a cluster with delcared config
k3d cluster create -c=../configs/k3d-cluster-config.yaml --agents-memory=14G

# Get the cluster information
kubectl cluster-info

echo "Run install-keptn.sh next."