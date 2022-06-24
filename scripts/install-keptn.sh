#!/bin/bash

# keptn install --use-case=continuous-delivery
helm install keptn keptn/keptn -n keptn --version=0.15.0 --create-namespace --set=continuous-delivery.enabled=true
helm install jmeter-service https://github.com/keptn/keptn/releases/download/0.15.0/jmeter-service-0.15.0.tgz -n keptn --create-namespace --wait
helm install helm-service https://github.com/keptn/keptn/releases/download/0.15.0/helm-service-0.15.0.tgz -n keptn --create-namespace --wait


echo "Run expose-keptn.sh next"