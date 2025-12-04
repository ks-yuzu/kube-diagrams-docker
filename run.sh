#!/usr/bin/env bash
set -euo pipefail

kubectl get --all-namespaces -o yaml \
   all,gateway,httproute,secret,configmap,pdb,application,GCPBackendPolicy,HealthCheckPolicy,PodMonitor,ServiceMonitor,ExternalSecret,SecretStore \
  | docker compose run --rm kube-diagrams

open /tmp/kube-diagrams/all.png
