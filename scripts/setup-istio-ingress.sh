#!/bin/zsh

kubectl create namespace istio-ingress
../istio-1.14.1/bin/istioctl install -f ../configs/istio-ingress.yaml