#!/bin/bash

INGRESS_PORT=8080
INGRESS_IP=127.0.0.1
kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: api-keptn-ingress
  namespace: keptn
  annotations:
    ingress.kubernetes.io/ssl-redirect: "false"
spec:
  rules:
  - http:
      paths:
      - backend:
          serviceName: api-gateway-nginx
          servicePort: 80
EOF
kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: api-keptn-ingress
  namespace: keptn
  annotations:
    ingress.kubernetes.io/ssl-redirect: "false"
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: api-gateway-nginx
            port:
              number: 80
EOF

kubectl -n keptn delete secret bridge-credentials --ignore-not-found=true

kubectl -n keptn delete pods --selector=app.kubernetes.io/name=bridge --wait

keptn auth --endpoint=http://$INGRESS_IP.nip.io:$INGRESS_PORT --api-token=$(kubectl get secret keptn-api-token -n keptn -ojsonpath={.data.keptn-api-token} | base64 --decode)