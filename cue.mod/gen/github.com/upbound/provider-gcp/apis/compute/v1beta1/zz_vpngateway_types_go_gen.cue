// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#VPNGatewayInitParameters: {
	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#VPNGatewayObservation: {
	// Creation timestamp in RFC3339 text format.
	creationTimestamp?: null | string @go(CreationTimestamp,*string)

	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// The unique identifier for the resource.
	gatewayId?: null | float64 @go(GatewayID,*float64)

	// an identifier for the resource with format projects/{{project}}/regions/{{region}}/targetVpnGateways/{{name}}
	id?: null | string @go(ID,*string)

	// The network this VPN gateway is accepting traffic for.
	network?: null | string @go(Network,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The region this gateway should sit in.
	region?: null | string @go(Region,*string)

	// The URI of the created resource.
	selfLink?: null | string @go(SelfLink,*string)
}

#VPNGatewayParameters: {
	// An optional description of this resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The network this VPN gateway is accepting traffic for.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Network
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	network?: null | string @go(Network,*string)

	// Reference to a Network in compute to populate network.
	// +kubebuilder:validation:Optional
	networkRef?: null | v1.#Reference @go(NetworkRef,*v1.Reference)

	// Selector for a Network in compute to populate network.
	// +kubebuilder:validation:Optional
	networkSelector?: null | v1.#Selector @go(NetworkSelector,*v1.Selector)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The region this gateway should sit in.
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// VPNGatewaySpec defines the desired state of VPNGateway
#VPNGatewaySpec: {
	v1.#ResourceSpec
	forProvider: #VPNGatewayParameters @go(ForProvider)

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
	initProvider?: #VPNGatewayInitParameters @go(InitProvider)
}

// VPNGatewayStatus defines the observed state of VPNGateway.
#VPNGatewayStatus: {
	v1.#ResourceStatus
	atProvider?: #VPNGatewayObservation @go(AtProvider)
}

// VPNGateway is the Schema for the VPNGateways API. Represents a VPN gateway running in GCP.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#VPNGateway: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #VPNGatewaySpec    @go(Spec)
	status?:   #VPNGatewayStatus  @go(Status)
}

// VPNGatewayList contains a list of VPNGateways
#VPNGatewayList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#VPNGateway] @go(Items,[]VPNGateway)
}
