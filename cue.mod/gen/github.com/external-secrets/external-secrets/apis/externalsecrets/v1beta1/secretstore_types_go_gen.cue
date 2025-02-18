// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	corev1 "k8s.io/api/core/v1"
)

// SecretStoreSpec defines the desired state of SecretStore.
#SecretStoreSpec: {
	// Used to select the correct ESO controller (think: ingress.ingressClassName)
	// The ESO controller is instantiated with a specific controller name and filters ES based on this property
	// +optional
	controller?: string @go(Controller)

	// Used to configure the provider. Only one provider may be set
	provider?: null | #SecretStoreProvider @go(Provider,*SecretStoreProvider)

	// Used to configure http retries if failed
	// +optional
	retrySettings?: null | #SecretStoreRetrySettings @go(RetrySettings,*SecretStoreRetrySettings)

	// Used to configure store refresh interval in seconds. Empty or 0 will default to the controller config.
	// +optional
	refreshInterval?: int @go(RefreshInterval)

	// Used to constraint a ClusterSecretStore to specific namespaces. Relevant only to ClusterSecretStore
	// +optional
	conditions?: [...#ClusterSecretStoreCondition] @go(Conditions,[]ClusterSecretStoreCondition)
}

// ClusterSecretStoreCondition describes a condition by which to choose namespaces to process ExternalSecrets in
// for a ClusterSecretStore instance.
#ClusterSecretStoreCondition: {
	// Choose namespace using a labelSelector
	// +optional
	namespaceSelector?: null | metav1.#LabelSelector @go(NamespaceSelector,*metav1.LabelSelector)

	// Choose namespaces by name
	// +optional
	namespaces?: [...string] @go(Namespaces,[]string)

	// Choose namespaces by using regex matching
	// +optional
	namespaceRegexes?: [...string] @go(NamespaceRegexes,[]string)
}

// SecretStoreProvider contains the provider-specific configuration.
// +kubebuilder:validation:MinProperties=1
// +kubebuilder:validation:MaxProperties=1
#SecretStoreProvider: {
	// AWS configures this store to sync secrets using AWS Secret Manager provider
	// +optional
	aws?: null | #AWSProvider @go(AWS,*AWSProvider)

	// AzureKV configures this store to sync secrets using Azure Key Vault provider
	// +optional
	azurekv?: null | #AzureKVProvider @go(AzureKV,*AzureKVProvider)

	// Akeyless configures this store to sync secrets using Akeyless Vault provider
	// +optional
	akeyless?: null | #AkeylessProvider @go(Akeyless,*AkeylessProvider)

	// BitwardenSecretsManager configures this store to sync secrets using BitwardenSecretsManager provider
	// +optional
	bitwardensecretsmanager?: null | #BitwardenSecretsManagerProvider @go(BitwardenSecretsManager,*BitwardenSecretsManagerProvider)

	// Vault configures this store to sync secrets using Hashi provider
	// +optional
	vault?: null | #VaultProvider @go(Vault,*VaultProvider)

	// GCPSM configures this store to sync secrets using Google Cloud Platform Secret Manager provider
	// +optional
	gcpsm?: null | #GCPSMProvider @go(GCPSM,*GCPSMProvider)

	// Oracle configures this store to sync secrets using Oracle Vault provider
	// +optional
	oracle?: null | #OracleProvider @go(Oracle,*OracleProvider)

	// IBM configures this store to sync secrets using IBM Cloud provider
	// +optional
	ibm?: null | #IBMProvider @go(IBM,*IBMProvider)

	// YandexCertificateManager configures this store to sync secrets using Yandex Certificate Manager provider
	// +optional
	yandexcertificatemanager?: null | #YandexCertificateManagerProvider @go(YandexCertificateManager,*YandexCertificateManagerProvider)

	// YandexLockbox configures this store to sync secrets using Yandex Lockbox provider
	// +optional
	yandexlockbox?: null | #YandexLockboxProvider @go(YandexLockbox,*YandexLockboxProvider)

	// GitLab configures this store to sync secrets using GitLab Variables provider
	// +optional
	gitlab?: null | #GitlabProvider @go(Gitlab,*GitlabProvider)

	// Alibaba configures this store to sync secrets using Alibaba Cloud provider
	// +optional
	alibaba?: null | #AlibabaProvider @go(Alibaba,*AlibabaProvider)

	// OnePassword configures this store to sync secrets using the 1Password Cloud provider
	// +optional
	onepassword?: null | #OnePasswordProvider @go(OnePassword,*OnePasswordProvider)

	// Webhook configures this store to sync secrets using a generic templated webhook
	// +optional
	webhook?: null | #WebhookProvider @go(Webhook,*WebhookProvider)

	// Kubernetes configures this store to sync secrets using a Kubernetes cluster provider
	// +optional
	kubernetes?: null | #KubernetesProvider @go(Kubernetes,*KubernetesProvider)

	// Fake configures a store with static key/value pairs
	// +optional
	fake?: null | #FakeProvider @go(Fake,*FakeProvider)

	// Senhasegura configures this store to sync secrets using senhasegura provider
	// +optional
	senhasegura?: null | #SenhaseguraProvider @go(Senhasegura,*SenhaseguraProvider)

	// Scaleway
	// +optional
	scaleway?: null | #ScalewayProvider @go(Scaleway,*ScalewayProvider)

	// Doppler configures this store to sync secrets using the Doppler provider
	// +optional
	doppler?: null | #DopplerProvider @go(Doppler,*DopplerProvider)

	// Previder configures this store to sync secrets using the Previder provider
	// +optional
	previder?: null | #PreviderProvider @go(Previder,*PreviderProvider)

	// Onboardbase configures this store to sync secrets using the Onboardbase provider
	// +optional
	onboardbase?: null | #OnboardbaseProvider @go(Onboardbase,*OnboardbaseProvider)

	// KeeperSecurity configures this store to sync secrets using the KeeperSecurity provider
	// +optional
	keepersecurity?: null | #KeeperSecurityProvider @go(KeeperSecurity,*KeeperSecurityProvider)

	// Conjur configures this store to sync secrets using conjur provider
	// +optional
	conjur?: null | #ConjurProvider @go(Conjur,*ConjurProvider)

	// Delinea DevOps Secrets Vault
	// https://docs.delinea.com/online-help/products/devops-secrets-vault/current
	// +optional
	delinea?: null | #DelineaProvider @go(Delinea,*DelineaProvider)

	// SecretServer configures this store to sync secrets using SecretServer provider
	// https://docs.delinea.com/online-help/secret-server/start.htm
	// +optional
	secretserver?: null | #SecretServerProvider @go(SecretServer,*SecretServerProvider)

	// Chef configures this store to sync secrets with chef server
	// +optional
	chef?: null | #ChefProvider @go(Chef,*ChefProvider)

	// Pulumi configures this store to sync secrets using the Pulumi provider
	// +optional
	pulumi?: null | #PulumiProvider @go(Pulumi,*PulumiProvider)

	// Fortanix configures this store to sync secrets using the Fortanix provider
	// +optional
	fortanix?: null | #FortanixProvider @go(Fortanix,*FortanixProvider)

	// +optional
	passworddepot?: null | #PasswordDepotProvider @go(PasswordDepot,*PasswordDepotProvider)

	// +optional
	passbolt?: null | #PassboltProvider @go(Passbolt,*PassboltProvider)

	// Device42 configures this store to sync secrets using the Device42 provider
	// +optional
	device42?: null | #Device42Provider @go(Device42,*Device42Provider)

	// Infisical configures this store to sync secrets using the Infisical provider
	// +optional
	infisical?: null | #InfisicalProvider @go(Infisical,*InfisicalProvider)

	// Beyondtrust configures this store to sync secrets using Password Safe provider.
	// +optional
	beyondtrust?: null | #BeyondtrustProvider @go(Beyondtrust,*BeyondtrustProvider)
}

#CAProviderType: string // #enumCAProviderType

#enumCAProviderType:
	#CAProviderTypeSecret |
	#CAProviderTypeConfigMap

#CAProviderTypeSecret:    #CAProviderType & "Secret"
#CAProviderTypeConfigMap: #CAProviderType & "ConfigMap"

// Used to provide custom certificate authority (CA) certificates
// for a secret store. The CAProvider points to a Secret or ConfigMap resource
// that contains a PEM-encoded certificate.
#CAProvider: {
	// The type of provider to use such as "Secret", or "ConfigMap".
	// +kubebuilder:validation:Enum="Secret";"ConfigMap"
	type: #CAProviderType @go(Type)

	// The name of the object located at the provider type.
	name: string @go(Name)

	// The key where the CA certificate can be found in the Secret or ConfigMap.
	// +kubebuilder:validation:Optional
	key?: string @go(Key)

	// The namespace the Provider type is in.
	// Can only be defined when used in a ClusterSecretStore.
	// +optional
	namespace?: null | string @go(Namespace,*string)
}

#SecretStoreRetrySettings: {
	maxRetries?:    null | int32  @go(MaxRetries,*int32)
	retryInterval?: null | string @go(RetryInterval,*string)
}

#SecretStoreConditionType: string // #enumSecretStoreConditionType

#enumSecretStoreConditionType:
	#SecretStoreReady

#SecretStoreReady:            #SecretStoreConditionType & "Ready"
#ReasonInvalidStore:          "InvalidStoreConfiguration"
#ReasonInvalidProviderConfig: "InvalidProviderConfig"
#ReasonValidationFailed:      "ValidationFailed"
#ReasonStoreValid:            "Valid"

#SecretStoreStatusCondition: {
	type:   #SecretStoreConditionType @go(Type)
	status: corev1.#ConditionStatus   @go(Status)

	// +optional
	reason?: string @go(Reason)

	// +optional
	message?: string @go(Message)

	// +optional
	lastTransitionTime?: metav1.#Time @go(LastTransitionTime)
}

// SecretStoreCapabilities defines the possible operations a SecretStore can do.
#SecretStoreCapabilities: string // #enumSecretStoreCapabilities

#enumSecretStoreCapabilities:
	#SecretStoreReadOnly |
	#SecretStoreWriteOnly |
	#SecretStoreReadWrite

#SecretStoreReadOnly:  #SecretStoreCapabilities & "ReadOnly"
#SecretStoreWriteOnly: #SecretStoreCapabilities & "WriteOnly"
#SecretStoreReadWrite: #SecretStoreCapabilities & "ReadWrite"

// SecretStoreStatus defines the observed state of the SecretStore.
#SecretStoreStatus: {
	// +optional
	conditions?: [...#SecretStoreStatusCondition] @go(Conditions,[]SecretStoreStatusCondition)

	// +optional
	capabilities?: #SecretStoreCapabilities @go(Capabilities)
}

// SecretStore represents a secure external location for storing secrets, which can be referenced as part of `storeRef` fields.
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:printcolumn:name="Status",type=string,JSONPath=`.status.conditions[?(@.type=="Ready")].reason`
// +kubebuilder:printcolumn:name="Capabilities",type=string,JSONPath=`.status.capabilities`
// +kubebuilder:printcolumn:name="Ready",type=string,JSONPath=`.status.conditions[?(@.type=="Ready")].status`
// +kubebuilder:subresource:status
// +kubebuilder:metadata:labels="external-secrets.io/component=controller"
// +kubebuilder:resource:scope=Namespaced,categories={external-secrets},shortName=ss
#SecretStore: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #SecretStoreSpec   @go(Spec)
	status?:   #SecretStoreStatus @go(Status)
}

// SecretStoreList contains a list of SecretStore resources.
#SecretStoreList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#SecretStore] @go(Items,[]SecretStore)
}

// ClusterSecretStore represents a secure external location for storing secrets, which can be referenced as part of `storeRef` fields.
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:printcolumn:name="Status",type=string,JSONPath=`.status.conditions[?(@.type=="Ready")].reason`
// +kubebuilder:printcolumn:name="Capabilities",type=string,JSONPath=`.status.capabilities`
// +kubebuilder:printcolumn:name="Ready",type=string,JSONPath=`.status.conditions[?(@.type=="Ready")].status`
// +kubebuilder:subresource:status
// +kubebuilder:metadata:labels="external-secrets.io/component=controller"
// +kubebuilder:resource:scope=Cluster,categories={external-secrets},shortName=css
#ClusterSecretStore: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #SecretStoreSpec   @go(Spec)
	status?:   #SecretStoreStatus @go(Status)
}

// ClusterSecretStoreList contains a list of ClusterSecretStore resources.
#ClusterSecretStoreList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ClusterSecretStore] @go(Items,[]ClusterSecretStore)
}
