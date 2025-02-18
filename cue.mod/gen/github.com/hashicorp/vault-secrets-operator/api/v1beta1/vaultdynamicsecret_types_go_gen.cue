// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/hashicorp/vault-secrets-operator/api/v1beta1

package v1beta1

import (
	"k8s.io/apimachinery/pkg/types"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// VaultDynamicSecretSpec defines the desired state of VaultDynamicSecret
#VaultDynamicSecretSpec: {
	// VaultAuthRef to the VaultAuth resource, can be prefixed with a namespace,
	// eg: `namespaceA/vaultAuthRefB`. If no namespace prefix is provided it will default to
	// namespace of the VaultAuth CR. If no value is specified for VaultAuthRef the Operator will
	// default to the `default` VaultAuth, configured in the operator's namespace.
	vaultAuthRef?: string @go(VaultAuthRef)

	// Namespace where the secrets engine is mounted in Vault.
	namespace?: string @go(Namespace)

	// Mount path of the secret's engine in Vault.
	mount: string @go(Mount)

	// RequestHTTPMethod to use when syncing Secrets from Vault.
	// Setting a value here is not typically required.
	// If left unset the Operator will make requests using the GET method.
	// In the case where Params are specified the Operator will use the PUT method.
	// Please consult https://developer.hashicorp.com/vault/docs/secrets if you are
	// uncertain about what method to use.
	// Of note, the Vault client treats PUT and POST as being equivalent.
	// The underlying Vault client implementation will always use the PUT method.
	// +kubebuilder:validation:Enum={GET,POST,PUT}
	requestHTTPMethod?: string @go(RequestHTTPMethod)

	// Path in Vault to get the credentials for, and is relative to Mount.
	// Please consult https://developer.hashicorp.com/vault/docs/secrets if you are
	// uncertain about what 'path' should be set to.
	path: string @go(Path)

	// Params that can be passed when requesting credentials/secrets.
	// When Params is set the configured RequestHTTPMethod will be
	// ignored. See RequestHTTPMethod for more details.
	// Please consult https://developer.hashicorp.com/vault/docs/secrets if you are
	// uncertain about what 'params' should/can be set to.
	params?: {[string]: string} @go(Params,map[string]string)

	// RenewalPercent is the percent out of 100 of the lease duration when the
	// lease is renewed. Defaults to 67 percent plus jitter.
	// +kubebuilder:default=67
	// +kubebuilder:validation:Minimum=0
	// +kubebuilder:validation:Maximum=90
	renewalPercent?: int @go(RenewalPercent)

	// Revoke the existing lease on VDS resource deletion.
	revoke?: bool @go(Revoke)

	// AllowStaticCreds should be set when syncing credentials that are periodically
	// rotated by the Vault server, rather than created upon request. These secrets
	// are sometimes referred to as "static roles", or "static credentials", with a
	// request path that contains "static-creds".
	allowStaticCreds?: bool @go(AllowStaticCreds)

	// RolloutRestartTargets should be configured whenever the application(s) consuming the Vault secret does
	// not support dynamically reloading a rotated secret.
	// In that case one, or more RolloutRestartTarget(s) can be configured here. The Operator will
	// trigger a "rollout-restart" for each target whenever the Vault secret changes between reconciliation events.
	// See RolloutRestartTarget for more details.
	rolloutRestartTargets?: [...#RolloutRestartTarget] @go(RolloutRestartTargets,[]RolloutRestartTarget)

	// Destination provides configuration necessary for syncing the Vault secret to Kubernetes.
	destination: #Destination @go(Destination)
}

// VaultDynamicSecretStatus defines the observed state of VaultDynamicSecret
#VaultDynamicSecretStatus: {
	// LastRenewalTime of the last successful secret lease renewal.
	lastRenewalTime: int64 @go(LastRenewalTime)

	// LastGeneration is the Generation of the last reconciled resource.
	lastGeneration: int64 @go(LastGeneration)

	// SecretLease for the Vault secret.
	secretLease: #VaultSecretLease @go(SecretLease)

	// StaticCredsMetaData contains the static creds response meta-data
	staticCredsMetaData?: #VaultStaticCredsMetaData @go(StaticCredsMetaData)

	// LastRuntimePodUID used for tracking the transition from one Pod to the next.
	// It is used to mitigate the effects of a Vault lease renewal storm.
	lastRuntimePodUID?: types.#UID @go(LastRuntimePodUID)

	// SecretMAC used when deciding whether new Vault secret data should be synced.
	//
	// The controller will compare the "new" Vault secret data to this value using HMAC,
	// if they are different, then the data will be synced to the Destination.
	//
	// The SecretMac is also used to detect drift in the Destination Secret's Data.
	// If drift is detected the data will be synced to the Destination.
	// SecretMAC will only be stored when VaultDynamicSecretSpec.AllowStaticCreds is true.
	secretMAC?: string @go(SecretMAC)
}

#VaultSecretLease: {
	// ID of the Vault secret.
	id: string @go(ID)

	// LeaseDuration of the Vault secret.
	duration: int @go(LeaseDuration)

	// Renewable Vault secret lease
	renewable: bool @go(Renewable)

	// RequestID of the Vault secret request.
	requestID: string @go(RequestID)
}

#VaultStaticCredsMetaData: {
	// LastVaultRotation represents the last time Vault rotated the password
	lastVaultRotation: int64 @go(LastVaultRotation)

	// RotationPeriod is number in seconds between each rotation, effectively a
	// "time to live". This value is compared to the LastVaultRotation to
	// determine if a password needs to be rotated
	rotationPeriod: int64 @go(RotationPeriod)

	// RotationSchedule is a "cron style" string representing the allowed
	// schedule for each rotation.
	// e.g. "1 0 * * *" would rotate at one minute past midnight (00:01) every
	// day.
	rotationSchedule: string @go(RotationSchedule)

	// TTL is the seconds remaining before the next rotation.
	ttl: int64 @go(TTL)
}

// VaultDynamicSecret is the Schema for the vaultdynamicsecrets API
#VaultDynamicSecret: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta        @go(ObjectMeta)
	spec?:     #VaultDynamicSecretSpec   @go(Spec)
	status?:   #VaultDynamicSecretStatus @go(Status)
}

// VaultDynamicSecretList contains a list of VaultDynamicSecret
#VaultDynamicSecretList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#VaultDynamicSecret] @go(Items,[]VaultDynamicSecret)
}
