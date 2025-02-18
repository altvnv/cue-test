// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/pkg/k8s/apis/cilium.io/v2

package v2

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"github.com/cilium/cilium/pkg/policy/api"
)

// CiliumClusterwideNetworkPolicy is a Kubernetes third-party resource with an
// modified version of CiliumNetworkPolicy which is cluster scoped rather than
// namespace scoped.
#CiliumClusterwideNetworkPolicy: {
	metav1.#TypeMeta

	// +deepequal-gen=false
	metadata: metav1.#ObjectMeta @go(ObjectMeta)

	// Spec is the desired Cilium specific rule specification.
	spec?: null | api.#Rule @go(Spec,*api.Rule)

	// Specs is a list of desired Cilium specific rule specification.
	specs?: api.#Rules @go(Specs)

	// Status is the status of the Cilium policy rule.
	//
	// The reason this field exists in this structure is due a bug in the k8s
	// code-generator that doesn't create a `UpdateStatus` method because the
	// field does not exist in the structure.
	//
	// +kubebuilder:validation:Optional
	status: #CiliumNetworkPolicyStatus @go(Status)
}

// CiliumClusterwideNetworkPolicyList is a list of
// CiliumClusterwideNetworkPolicy objects.
#CiliumClusterwideNetworkPolicyList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)

	// Items is a list of CiliumClusterwideNetworkPolicies.
	items: [...#CiliumClusterwideNetworkPolicy] @go(Items,[]CiliumClusterwideNetworkPolicy)
}
