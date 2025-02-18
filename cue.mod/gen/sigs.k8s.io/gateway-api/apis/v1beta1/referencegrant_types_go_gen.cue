// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go sigs.k8s.io/gateway-api/apis/v1beta1

package v1beta1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"sigs.k8s.io/gateway-api/apis/v1"
)

// ReferenceGrant identifies kinds of resources in other namespaces that are
// trusted to reference the specified kinds of resources in the same namespace
// as the policy.
//
// Each ReferenceGrant can be used to represent a unique trust relationship.
// Additional Reference Grants can be used to add to the set of trusted
// sources of inbound references for the namespace they are defined within.
//
// All cross-namespace references in Gateway API (with the exception of cross-namespace
// Gateway-route attachment) require a ReferenceGrant.
//
// ReferenceGrant is a form of runtime verification allowing users to assert
// which cross-namespace object references are permitted. Implementations that
// support ReferenceGrant MUST NOT permit cross-namespace references which have
// no grant, and MUST respond to the removal of a grant by revoking the access
// that the grant allowed.
#ReferenceGrant: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// Spec defines the desired state of ReferenceGrant.
	spec?: #ReferenceGrantSpec @go(Spec)
}

// +kubebuilder:object:root=true
// ReferenceGrantList contains a list of ReferenceGrant.
#ReferenceGrantList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ReferenceGrant] @go(Items,[]ReferenceGrant)
}

// ReferenceGrantSpec identifies a cross namespace relationship that is trusted
// for Gateway API.
#ReferenceGrantSpec: {
	// From describes the trusted namespaces and kinds that can reference the
	// resources described in "To". Each entry in this list MUST be considered
	// to be an additional place that references can be valid from, or to put
	// this another way, entries MUST be combined using OR.
	//
	// Support: Core
	//
	// +kubebuilder:validation:MinItems=1
	// +kubebuilder:validation:MaxItems=16
	from: [...#ReferenceGrantFrom] @go(From,[]ReferenceGrantFrom)

	// To describes the resources that may be referenced by the resources
	// described in "From". Each entry in this list MUST be considered to be an
	// additional place that references can be valid to, or to put this another
	// way, entries MUST be combined using OR.
	//
	// Support: Core
	//
	// +kubebuilder:validation:MinItems=1
	// +kubebuilder:validation:MaxItems=16
	to: [...#ReferenceGrantTo] @go(To,[]ReferenceGrantTo)
}

// ReferenceGrantFrom describes trusted namespaces and kinds.
#ReferenceGrantFrom: {
	// Group is the group of the referent.
	// When empty, the Kubernetes core API group is inferred.
	//
	// Support: Core
	group: v1.#Group @go(Group,sigs.k8s.io/gateway-api/apis/v1.Group)

	// Kind is the kind of the referent. Although implementations may support
	// additional resources, the following types are part of the "Core"
	// support level for this field.
	//
	// When used to permit a SecretObjectReference:
	//
	// * Gateway
	//
	// When used to permit a BackendObjectReference:
	//
	// * GRPCRoute
	// * HTTPRoute
	// * TCPRoute
	// * TLSRoute
	// * UDPRoute
	kind: v1.#Kind @go(Kind,sigs.k8s.io/gateway-api/apis/v1.Kind)

	// Namespace is the namespace of the referent.
	//
	// Support: Core
	namespace: v1.#Namespace @go(Namespace,sigs.k8s.io/gateway-api/apis/v1.Namespace)
}

// ReferenceGrantTo describes what Kinds are allowed as targets of the
// references.
#ReferenceGrantTo: {
	// Group is the group of the referent.
	// When empty, the Kubernetes core API group is inferred.
	//
	// Support: Core
	group: v1.#Group @go(Group,sigs.k8s.io/gateway-api/apis/v1.Group)

	// Kind is the kind of the referent. Although implementations may support
	// additional resources, the following types are part of the "Core"
	// support level for this field:
	//
	// * Secret when used to permit a SecretObjectReference
	// * Service when used to permit a BackendObjectReference
	kind: v1.#Kind @go(Kind,sigs.k8s.io/gateway-api/apis/v1.Kind)

	// Name is the name of the referent. When unspecified, this policy
	// refers to all resources of the specified Group and Kind in the local
	// namespace.
	//
	// +optional
	name?: null | v1.#ObjectName @go(Name,*sigs.k8s.io/gateway-api/apis/v1.ObjectName)
}
