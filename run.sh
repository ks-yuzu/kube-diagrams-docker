#!/usr/bin/env bash
set -euo pipefail

kebectl_get_all_existing() {
  local crds=(
    Gateway
    HTTPRoute
    Application
    PodMonitor
    ServiceMonitor
    ExternalSecret
    SecretStore
    GCPBackendPolicy
    HealthCheckPolicy
  )

  local exists
  exists() {
    local kind="$1"
    kubectl api-resources 2>/dev/null \
      | awk -v k="$kind" 'tolower($NF)==tolower(k){found=1} END{exit !found}'
  }

  local available=(all ingress secret configmap pdb)
  for r in "${crds[@]}"; do
    if exists "$r"; then
      available+=("$r")
    fi
  done

  local kinds=$(IFS=,; echo "${available[*]}")
  kubectl get --all-namespaces -o yaml $kinds
}


# kubectl get --all-namespaces -o yaml \
#    all,gateway,httproute,secret,configmap,pdb,application,GCPBackendPolicy,HealthCheckPolicy,PodMonitor,ServiceMonitor,ExternalSecret,SecretStore \
kebectl_get_all_existing | docker compose run --rm kube-diagrams
open /tmp/kube-diagrams/all.png
