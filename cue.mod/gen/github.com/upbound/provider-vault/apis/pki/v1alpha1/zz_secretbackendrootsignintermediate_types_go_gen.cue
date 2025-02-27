// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-vault/apis/pki/v1alpha1

package v1alpha1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#SecretBackendRootSignIntermediateInitParameters: {
	// List of alternative names.
	altNames?: [...null | string] @go(AltNames,[]*string)

	// The PKI secret backend the resource belongs to.
	backend?: null | string @go(Backend,*string)

	// CN of intermediate to create.
	commonName?: null | string @go(CommonName,*string)

	// The country.
	country?: null | string @go(Country,*string)

	// The CSR.
	csr?: null | string @go(Csr,*string)

	// Flag to exclude CN from SANs.
	excludeCnFromSans?: null | bool @go(ExcludeCnFromSans,*bool)

	// The format of data.
	format?: null | string @go(Format,*string)

	// List of alternative IPs.
	ipSans?: [...null | string] @go(IPSans,[]*string)

	// Specifies the default issuer of this request.
	issuerRef?: null | string @go(IssuerRef,*string)

	// The locality.
	locality?: null | string @go(Locality,*string)

	// The maximum path length to encode in the generated certificate.
	maxPathLength?: null | float64 @go(MaxPathLength,*float64)

	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// The organization.
	organization?: null | string @go(Organization,*string)

	// List of other SANs.
	otherSans?: [...null | string] @go(OtherSans,[]*string)

	// The organization unit.
	ou?: null | string @go(Ou,*string)

	// List of domains for which certificates are allowed to be issued.
	permittedDnsDomains?: [...null | string] @go(PermittedDNSDomains,[]*string)

	// The postal code.
	postalCode?: null | string @go(PostalCode,*string)

	// The province.
	province?: null | string @go(Province,*string)

	// Revoke the certificate upon resource destruction.
	revoke?: null | bool @go(Revoke,*bool)

	// The street address.
	streetAddress?: null | string @go(StreetAddress,*string)

	// Time to live.
	ttl?: null | string @go(TTL,*string)

	// List of alternative URIs.
	uriSans?: [...null | string] @go(URISans,[]*string)

	// Preserve CSR values.
	useCsrValues?: null | bool @go(UseCsrValues,*bool)
}

#SecretBackendRootSignIntermediateObservation: {
	// List of alternative names.
	altNames?: [...null | string] @go(AltNames,[]*string)

	// The PKI secret backend the resource belongs to.
	backend?: null | string @go(Backend,*string)

	// The CA chain as a list of format specific certificates
	caChain?: [...null | string] @go(CAChain,[]*string)

	// The signed intermediate CA certificate.
	certificate?: null | string @go(Certificate,*string)

	// The concatenation of the intermediate and issuing CA certificates (PEM encoded). Requires the format to be set to any of: pem, pem_bundle. The value will be empty for all other formats.
	certificateBundle?: null | string @go(CertificateBundle,*string)

	// CN of intermediate to create.
	commonName?: null | string @go(CommonName,*string)

	// The country.
	country?: null | string @go(Country,*string)

	// The CSR.
	csr?: null | string @go(Csr,*string)

	// Flag to exclude CN from SANs.
	excludeCnFromSans?: null | bool @go(ExcludeCnFromSans,*bool)

	// The format of data.
	format?: null | string @go(Format,*string)
	id?:     null | string @go(ID,*string)

	// List of alternative IPs.
	ipSans?: [...null | string] @go(IPSans,[]*string)

	// Specifies the default issuer of this request.
	issuerRef?: null | string @go(IssuerRef,*string)

	// The issuing CA certificate.
	issuingCa?: null | string @go(IssuingCA,*string)

	// The locality.
	locality?: null | string @go(Locality,*string)

	// The maximum path length to encode in the generated certificate.
	maxPathLength?: null | float64 @go(MaxPathLength,*float64)

	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// The organization.
	organization?: null | string @go(Organization,*string)

	// List of other SANs.
	otherSans?: [...null | string] @go(OtherSans,[]*string)

	// The organization unit.
	ou?: null | string @go(Ou,*string)

	// List of domains for which certificates are allowed to be issued.
	permittedDnsDomains?: [...null | string] @go(PermittedDNSDomains,[]*string)

	// The postal code.
	postalCode?: null | string @go(PostalCode,*string)

	// The province.
	province?: null | string @go(Province,*string)

	// Revoke the certificate upon resource destruction.
	revoke?: null | bool @go(Revoke,*bool)

	// The serial number.
	serial?: null | string @go(Serial,*string)

	// The certificate's serial number, hex formatted.
	serialNumber?: null | string @go(SerialNumber,*string)

	// The street address.
	streetAddress?: null | string @go(StreetAddress,*string)

	// Time to live.
	ttl?: null | string @go(TTL,*string)

	// List of alternative URIs.
	uriSans?: [...null | string] @go(URISans,[]*string)

	// Preserve CSR values.
	useCsrValues?: null | bool @go(UseCsrValues,*bool)
}

#SecretBackendRootSignIntermediateParameters: {
	// List of alternative names.
	// +kubebuilder:validation:Optional
	altNames?: [...null | string] @go(AltNames,[]*string)

	// The PKI secret backend the resource belongs to.
	// +kubebuilder:validation:Optional
	backend?: null | string @go(Backend,*string)

	// CN of intermediate to create.
	// +kubebuilder:validation:Optional
	commonName?: null | string @go(CommonName,*string)

	// The country.
	// +kubebuilder:validation:Optional
	country?: null | string @go(Country,*string)

	// The CSR.
	// +kubebuilder:validation:Optional
	csr?: null | string @go(Csr,*string)

	// Flag to exclude CN from SANs.
	// +kubebuilder:validation:Optional
	excludeCnFromSans?: null | bool @go(ExcludeCnFromSans,*bool)

	// The format of data.
	// +kubebuilder:validation:Optional
	format?: null | string @go(Format,*string)

	// List of alternative IPs.
	// +kubebuilder:validation:Optional
	ipSans?: [...null | string] @go(IPSans,[]*string)

	// Specifies the default issuer of this request.
	// +kubebuilder:validation:Optional
	issuerRef?: null | string @go(IssuerRef,*string)

	// The locality.
	// +kubebuilder:validation:Optional
	locality?: null | string @go(Locality,*string)

	// The maximum path length to encode in the generated certificate.
	// +kubebuilder:validation:Optional
	maxPathLength?: null | float64 @go(MaxPathLength,*float64)

	// Target namespace. (requires Enterprise)
	// +kubebuilder:validation:Optional
	namespace?: null | string @go(Namespace,*string)

	// The organization.
	// +kubebuilder:validation:Optional
	organization?: null | string @go(Organization,*string)

	// List of other SANs.
	// +kubebuilder:validation:Optional
	otherSans?: [...null | string] @go(OtherSans,[]*string)

	// The organization unit.
	// +kubebuilder:validation:Optional
	ou?: null | string @go(Ou,*string)

	// List of domains for which certificates are allowed to be issued.
	// +kubebuilder:validation:Optional
	permittedDnsDomains?: [...null | string] @go(PermittedDNSDomains,[]*string)

	// The postal code.
	// +kubebuilder:validation:Optional
	postalCode?: null | string @go(PostalCode,*string)

	// The province.
	// +kubebuilder:validation:Optional
	province?: null | string @go(Province,*string)

	// Revoke the certificate upon resource destruction.
	// +kubebuilder:validation:Optional
	revoke?: null | bool @go(Revoke,*bool)

	// The street address.
	// +kubebuilder:validation:Optional
	streetAddress?: null | string @go(StreetAddress,*string)

	// Time to live.
	// +kubebuilder:validation:Optional
	ttl?: null | string @go(TTL,*string)

	// List of alternative URIs.
	// +kubebuilder:validation:Optional
	uriSans?: [...null | string] @go(URISans,[]*string)

	// Preserve CSR values.
	// +kubebuilder:validation:Optional
	useCsrValues?: null | bool @go(UseCsrValues,*bool)
}

// SecretBackendRootSignIntermediateSpec defines the desired state of SecretBackendRootSignIntermediate
#SecretBackendRootSignIntermediateSpec: {
	v1.#ResourceSpec
	forProvider: #SecretBackendRootSignIntermediateParameters @go(ForProvider)

	// THIS IS AN ALPHA FIELD. Do not use it in production. It is not honored
	// unless the relevant Crossplane feature flag is enabled, and may be
	// changed or removed without notice.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #SecretBackendRootSignIntermediateInitParameters @go(InitProvider)
}

// SecretBackendRootSignIntermediateStatus defines the observed state of SecretBackendRootSignIntermediate.
#SecretBackendRootSignIntermediateStatus: {
	v1.#ResourceStatus
	atProvider?: #SecretBackendRootSignIntermediateObservation @go(AtProvider)
}

// SecretBackendRootSignIntermediate is the Schema for the SecretBackendRootSignIntermediates API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,vault}
#SecretBackendRootSignIntermediate: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.backend) || has(self.initProvider.backend)",message="backend is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.commonName) || has(self.initProvider.commonName)",message="commonName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.csr) || has(self.initProvider.csr)",message="csr is a required parameter"
	spec:    #SecretBackendRootSignIntermediateSpec   @go(Spec)
	status?: #SecretBackendRootSignIntermediateStatus @go(Status)
}

// SecretBackendRootSignIntermediateList contains a list of SecretBackendRootSignIntermediates
#SecretBackendRootSignIntermediateList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#SecretBackendRootSignIntermediate] @go(Items,[]SecretBackendRootSignIntermediate)
}
