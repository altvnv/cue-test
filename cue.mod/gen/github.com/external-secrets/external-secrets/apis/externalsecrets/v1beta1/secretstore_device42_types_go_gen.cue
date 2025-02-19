// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

import esmeta "github.com/external-secrets/external-secrets/apis/meta/v1"

// Device42Provider configures a store to sync secrets with a Device42 instance.
#Device42Provider: {
	// URL configures the Device42 instance URL.
	host: string @go(Host)

	// Auth configures how secret-manager authenticates with a Device42 instance.
	auth: #Device42Auth @go(Auth)
}

#Device42Auth: {
	secretRef: #Device42SecretRef @go(SecretRef)
}

#Device42SecretRef: {
	// Username / Password is used for authentication.
	// +optional
	credentials?: esmeta.#SecretKeySelector @go(Credentials)
}
