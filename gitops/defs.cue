package gitops

import "strings"

// ArgoCD
argocd: [TYPE=_]: [ID=_]: {
	apiVersion: "argoproj.io/v1alpha1"
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

argocd: close({
	application: [string]: argo_v1alpha1.#Application
	appProject: [string]:  argo_v1alpha1.#AppProject
})

// External Secrets
externalSecrets: [TYPE=_]: [ID=_]: {
	apiVersion: "external-secrets.io/v1beta1"
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

externalSecrets: close({
	clusterSecretStore: [string]: external_secrets_v1beta1.#ClusterSecretStore
	secretStore: [string]:        external_secrets_v1beta1.#SecretStore
	externalSecret: [ID=_]:       external_secrets_v1beta1.#ExternalSecret & {
		spec: target: name: *ID | string
	}
})

// Vault Secrets Operator
vaultSecrets: [TYPE=_]: [ID=_]: {
	apiVersion: "secrets.hashicorp.com/v1beta1"
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

vaultSecrets: close({
	vaultConnection: [string]: vault_secrets_v1beta1.#VaultConnection
	vaultAuth: [string]:       vault_secrets_v1beta1.#VaultAuth
	vaultStaticSecret: [ID=_]: vault_secrets_v1beta1.#VaultStaticSecret & {
		spec: destination: name: *ID | string
	}
	vaultPKISecret: [string]:     vault_secrets_v1beta1.#VaultPKISecret
	vaultDynamicSecret: [string]: vault_secrets_v1beta1.#VaultDynamicSecret
})

// Internal Kubernetes
kube: [TYPE=_]: [ID=_]: {
	apiVersion: *"v1" | string
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

kube: close({
	namespace: [string]:      core_v1.#Namespace
	serviceAccount: [string]: core_v1.#ServiceAccount
	secret: [string]:         core_v1.#Secret
	service: [string]:        core_v1.#Service
	ingress: [string]:        networking_v1.#Ingress & {
		apiVersion: "networking.k8s.io/v1"
	}
	deployment: [string]: apps_v1.#Deployment & {
		apiVersion: "apps/v1"
	}
	statefulSet: [string]: apps_v1.#StatefulSet & {
		apiVersion: "apps/v1"
	}
	storageClass: [string]: storage_v1.#StorageClass & {
		apiVersion: "storage.k8s.io/v1"
	}
	volumeSnapshotClass: [string]: snapshot_storage_v1.#VolumeSnapshotClass & {
		apiVersion: "snapshot.storage.k8s.io/v1"
	}
	frontendConfig: [string]: frontend_config_v1beta1.#FrontendConfig & {
		apiVersion: "networking.gke.io/v1beta1"
	}
	backendConfig: [string]: backend_config_v1.#BackendConfig & {
		apiVersion: "cloud.google.com/v1"
	}
	clusterRole: [string]: rbac_v1.#ClusterRole & {
		apiVersion: "rbac.authorization.k8s.io/v1"
	}
	roleBinding: [string]: rbac_v1.#RoleBinding & {
		apiVersion: "rbac.authorization.k8s.io/v1"
	}
	clusterRoleBinding: [string]: rbac_v1.#ClusterRoleBinding & {
		apiVersion: "rbac.authorization.k8s.io/v1"
	}
})

// Victoria Metrics Operator
vmOperator: [TYPE=_]: [ID=_]: {
	apiVersion: "operator.victoriametrics.com/v1beta1"
	kind:       strings.Replace(TYPE, "vm", "VM", 1)
	metadata: name: *ID | string
}
vmOperator: close({
	vmAgent: [string]:         vmoperator_v1beta1.#VMAgent
	vmPodScrape: [string]:     vmoperator_v1beta1.#VMPodScrape
	vmNodeScrape: [string]:    vmoperator_v1beta1.#VMNodeScrape
	vmServiceScrape: [string]: vmoperator_v1beta1.#VMServiceScrape
	vmAlert: [string]:         vmoperator_v1beta1.#VMAlert
	vmAlertmanager: [ID=_]:    vmoperator_v1beta1.#VMAlertmanager & {
		spec: configSecret: *ID | string
	}
	vmAlertmanagerConfig: [string]: vmoperator_v1beta1.#VMAlertmanagerConfig
	vmAuth: [string]:               vmoperator_v1beta1.#VMAuth
	vmRule: [string]:               vmoperator_v1beta1.#VMRule
	vmSingle: [string]:             vmoperator_v1beta1.#VMSingle
	vmUser: [string]:               vmoperator_v1beta1.#VMUser
})

otelOperator: [TYPE=_]: [ID=_]: {
	apiVersion: "opentelemetry.io/v1beta1"
	kind:       strings.Replace(TYPE, "otel", "OpenTelemetry", 1)
	metadata: name: *ID | string
}
otelOperator: close({
	otelCollector: [string]: otel_v1beta1.#OpenTelemetryCollector
})

// Grafana Operator
grafanaOperator: [TYPE=_]: [ID=_]: {
	apiVersion: "grafana.integreatly.org/v1beta1"
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}
grafanaOperator: close({
	grafanaDashboard: [string]:  grafana_v1beta1.#GrafanaDashboard
	grafanaDatasource: [string]: grafana_v1beta1.#GrafanaDatasource
	grafanaFolder: [ID=_]:       grafana_v1beta1.#GrafanaFolder & {
		spec: title: *ID | string
	}
	grafana: [string]: grafana_v1beta1.#Grafana
})

// Cilium custom resources
cilium: [TYPE=_]: [ID=_]: {
	apiVersion: *"cilium.io/v2" | string
	kind:       *strings.ToTitle(TYPE) | string
	metadata: name: *ID | string
}

cilium: close({
	ciliumClusterwideNetworkPolicy: [string]: cilium_v2.#CiliumClusterwideNetworkPolicy
})

// Gateway API
gateway: [TYPE=_]: [ID=_]: {
	apiVersion: *"gateway.networking.k8s.io/v1" | string
	kind:       *strings.ToTitle(TYPE) | string
	metadata: name: *ID | string
}

gateway: close({
	gateway: [string]:      gateway_v1.#Gateway
	gatewayClass: [string]: gateway_v1.#GatewayClass
})

envoyproxy: [TYPE=_]: [ID=_]: {
	apiVersion: *"gateway.envoyproxy.io/v1alpha1" | string
	kind:       *strings.ToTitle(TYPE) | string
	metadata: name: *ID | string
}

envoyproxy: close({
	envoyProxy: [string]: envoyproxy_v1alpha1.#EnvoyProxy
})
