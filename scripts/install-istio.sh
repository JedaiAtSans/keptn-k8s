#!/bin/zsh

# ../istio-1.14.1/bin/istioctl manifest generate --set profile=minimal > ./istio-install-manifest.yaml
# ../istio-1.14.1/bin/istioctl install --set profile=minimal
# ../istio-1.14.1/bin/istioctl verify-install -f ./istio-install-manifest.yaml
../istio-1.14.1/bin/istioctl manifest generate > ./istio-install-manifest.yaml
../istio-1.14.1/bin/istioctl install -y
../istio-1.14.1/bin/istioctl verify-install -f ./istio-install-manifest.yaml
