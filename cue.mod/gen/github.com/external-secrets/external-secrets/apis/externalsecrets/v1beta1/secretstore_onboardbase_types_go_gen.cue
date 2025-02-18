// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

import esmeta "github.com/external-secrets/external-secrets/apis/meta/v1"

// OnboardbaseAuthSecretRef holds secret references for onboardbase API Key credentials.
#OnboardbaseAuthSecretRef: {
	// OnboardbaseAPIKey is the APIKey generated by an admin account.
	// It is used to recognize and authorize access to a project and environment within onboardbase
	// +kubebuilder:validation:Required
	apiKeyRef: esmeta.#SecretKeySelector @go(OnboardbaseAPIKeyRef)

	// OnboardbasePasscode is the passcode attached to the API Key
	// +kubebuilder:validation:Required
	passcodeRef: esmeta.#SecretKeySelector @go(OnboardbasePasscodeRef)
}

// OnboardbaseProvider configures a store to sync secrets using the Onboardbase provider.
// Project and Config are required if not using a Service Token.
#OnboardbaseProvider: {
	// Auth configures how the Operator authenticates with the Onboardbase API
	auth?: null | #OnboardbaseAuthSecretRef @go(Auth,*OnboardbaseAuthSecretRef)

	// APIHost use this to configure the host url for the API for selfhosted installation, default is https://public.onboardbase.com/api/v1/
	// +kubebuilder:default:="https://public.onboardbase.com/api/v1/"
	apiHost: string @go(APIHost)

	// Project is an onboardbase project that the secrets should be pulled from
	// +kubebuilder:validation:Required
	// +kubebuilder:default:="development"
	project: string @go(Project)

	// Environment is the name of an environmnent within a project to pull the secrets from
	// +kubebuilder:validation:Required
	// +kubebuilder:default:="development"
	environment: string @go(Environment)
}
