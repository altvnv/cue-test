// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

import esmeta "github.com/external-secrets/external-secrets/apis/meta/v1"

// BitwardenSecretsManagerProvider configures a store to sync secrets with a Bitwarden Secrets Manager instance.
#BitwardenSecretsManagerProvider: {
	apiURL?:                string @go(APIURL)
	identityURL?:           string @go(IdentityURL)
	bitwardenServerSDKURL?: string @go(BitwardenServerSDKURL)

	// Base64 encoded certificate for the bitwarden server sdk. The sdk MUST run with HTTPS to make sure no MITM attack
	// can be performed.
	// +optional
	caBundle?: string @go(CABundle)

	// see: https://external-secrets.io/latest/spec/#external-secrets.io/v1alpha1.CAProvider
	// +optional
	caProvider?: null | #CAProvider @go(CAProvider,*CAProvider)

	// OrganizationID determines which organization this secret store manages.
	organizationID: string @go(OrganizationID)

	// ProjectID determines which project this secret store manages.
	projectID: string @go(ProjectID)

	// Auth configures how secret-manager authenticates with a bitwarden machine account instance.
	// Make sure that the token being used has permissions on the given secret.
	auth: #BitwardenSecretsManagerAuth @go(Auth)
}

// BitwardenSecretsManagerAuth contains the ref to the secret that contains the machine account token.
#BitwardenSecretsManagerAuth: {
	secretRef: #BitwardenSecretsManagerSecretRef @go(SecretRef)
}

// BitwardenSecretsManagerSecretRef contains the credential ref to the bitwarden instance.
#BitwardenSecretsManagerSecretRef: {
	// AccessToken used for the bitwarden instance.
	// +required
	credentials: esmeta.#SecretKeySelector @go(Credentials)
}
