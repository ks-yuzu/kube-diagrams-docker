FROM philippemerle/kubediagrams@sha256:c1faa894a051aa7c6de6419efb029eb02e7b4914f485d274fe3a82decf3c9d15

ADD ./conf/kube-diagrams.yaml /usr/local/bin/kube-diagrams.yaml
ADD ./conf/config.kdc.yaml /tmp/config.kdc.yaml

ADD ./icons/Gateway-256.png /usr/local/bin/icons/Gateway-256.png
ADD ./icons/HTTPRoute-256.png /usr/local/bin/icons/HTTPRoute-256.png
ADD ./icons/GCPBackendPolicy-256.png /usr/local/bin/icons/GCPBackendPolicy-256.png
ADD ./icons/HealthCheckPolicy-256.png /usr/local/bin/icons/HealthCheckPolicy-256.png
ADD ./icons/ExternalSecret.png /usr/local/bin/icons/ExternalSecret.png
ADD ./icons/SecretStore.png /usr/local/bin/icons/SecretStore.png
# ADD ./icons/ClusterSecretStore.png /usr/local/bin/icons/ClusterSecretStore.png
ADD ./icons/ServiceMonitor-512.png /usr/local/bin/icons/ServiceMonitor-512.png
ADD ./icons/PodMonitor-512.png /usr/local/bin/icons/PodMonitor-512.png
ADD ./icons/ArgoCDApplication.png /usr/local/bin/icons/ArgoCDApplication.png
