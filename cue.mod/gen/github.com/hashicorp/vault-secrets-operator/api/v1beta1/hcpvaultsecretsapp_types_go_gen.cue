// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/hashicorp/vault-secrets-operator/api/v1beta1

package v1beta1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// HCPVaultSecretsAppSpec defines the desired state of HCPVaultSecretsApp
#HCPVaultSecretsAppSpec: {
	// AppName of the Vault Secrets Application that is to be synced.
	appName: string @go(AppName)

	// HCPAuthRef to the HCPAuth resource, can be prefixed with a namespace, eg:
	// `namespaceA/vaultAuthRefB`. If no namespace prefix is provided it will default
	// to the namespace of the HCPAuth CR. If no value is specified for HCPAuthRef the
	// Operator will default to the `default` HCPAuth, configured in the operator's
	// namespace.
	hcpAuthRef?: string @go(HCPAuthRef)

	// RefreshAfter a period of time, in duration notation e.g. 30s, 1m, 24h
	// +kubebuilder:validation:Type=string
	// +kubebuilder:validation:Pattern="^([0-9]+(\\.[0-9]+)?(s|m|h))$"
	// +kubebuilder:default="600s"
	refreshAfter?: string @go(RefreshAfter)

	// RolloutRestartTargets should be configured whenever the application(s)
	// consuming the HCP Vault Secrets App does not support dynamically reloading a
	// rotated secret. In that case one, or more RolloutRestartTarget(s) can be
	// configured here. The Operator will trigger a "rollout-restart" for each target
	// whenever the Vault secret changes between reconciliation events. See
	// RolloutRestartTarget for more details.
	rolloutRestartTargets?: [...#RolloutRestartTarget] @go(RolloutRestartTargets,[]RolloutRestartTarget)

	// Destination provides configuration necessary for syncing the HCP Vault
	// Application secrets to Kubernetes.
	destination: #Destination @go(Destination)
}

// HCPVaultSecretsAppStatus defines the observed state of HCPVaultSecretsApp
#HCPVaultSecretsAppStatus: {
	// LastGeneration is the Generation of the last reconciled resource.
	lastGeneration: int64 @go(LastGeneration)

	// SecretMAC used when deciding whether new Vault secret data should be synced.
	//
	// The controller will compare the "new" HCP Vault Secrets App data to this value
	// using HMAC, if they are different, then the data will be synced to the
	// Destination.
	//
	// The SecretMac is also used to detect drift in the Destination Secret's Data.
	// If drift is detected the data will be synced to the Destination.
	secretMAC?: string @go(SecretMAC)
}

// HCPVaultSecretsApp is the Schema for the hcpvaultsecretsapps API
#HCPVaultSecretsApp: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta        @go(ObjectMeta)
	spec?:     #HCPVaultSecretsAppSpec   @go(Spec)
	status?:   #HCPVaultSecretsAppStatus @go(Status)
}

// HCPVaultSecretsAppList contains a list of HCPVaultSecretsApp
#HCPVaultSecretsAppList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#HCPVaultSecretsApp] @go(Items,[]HCPVaultSecretsApp)
}
