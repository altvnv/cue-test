// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/pkg/k8s/apis/cilium.io/v2

package v2

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

#CiliumClusterwideEnvoyConfig: {
	metav1.#TypeMeta

	// +k8s:openapi-gen=false
	// +deepequal-gen=false
	metadata: metav1.#ObjectMeta @go(ObjectMeta)

	// +k8s:openapi-gen=false
	spec?: #CiliumEnvoyConfigSpec @go(Spec)
}

// CiliumClusterwideEnvoyConfigList is a list of CiliumClusterwideEnvoyConfig objects.
#CiliumClusterwideEnvoyConfigList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)

	// Items is a list of CiliumClusterwideEnvoyConfig.
	items: [...#CiliumClusterwideEnvoyConfig] @go(Items,[]CiliumClusterwideEnvoyConfig)
}
