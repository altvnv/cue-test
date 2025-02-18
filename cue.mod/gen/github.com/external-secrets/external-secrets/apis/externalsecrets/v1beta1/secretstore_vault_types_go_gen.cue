// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

import esmeta "github.com/external-secrets/external-secrets/apis/meta/v1"

#VaultKVStoreVersion: string // #enumVaultKVStoreVersion

#enumVaultKVStoreVersion:
	#VaultKVStoreV1 |
	#VaultKVStoreV2

#VaultKVStoreV1: #VaultKVStoreVersion & "v1"
#VaultKVStoreV2: #VaultKVStoreVersion & "v2"

// Configures an store to sync secrets using a HashiCorp Vault
// KV backend.
#VaultProvider: {
	// Auth configures how secret-manager authenticates with the Vault server.
	auth: #VaultAuth @go(Auth)

	// Server is the connection address for the Vault server, e.g: "https://vault.example.com:8200".
	server: string @go(Server)

	// Path is the mount path of the Vault KV backend endpoint, e.g:
	// "secret". The v2 KV secret engine version specific "/data" path suffix
	// for fetching secrets from Vault is optional and will be appended
	// if not present in specified path.
	// +optional
	path?: null | string @go(Path,*string)

	// Version is the Vault KV secret engine version. This can be either "v1" or
	// "v2". Version defaults to "v2".
	// +kubebuilder:validation:Optional
	// +kubebuilder:validation:Enum="v1";"v2"
	// +kubebuilder:default:="v2"
	version: #VaultKVStoreVersion @go(Version)

	// Name of the vault namespace. Namespaces is a set of features within Vault Enterprise that allows
	// Vault environments to support Secure Multi-tenancy. e.g: "ns1".
	// More about namespaces can be found here https://www.vaultproject.io/docs/enterprise/namespaces
	// +optional
	namespace?: null | string @go(Namespace,*string)

	// PEM encoded CA bundle used to validate Vault server certificate. Only used
	// if the Server URL is using HTTPS protocol. This parameter is ignored for
	// plain HTTP protocol connection. If not set the system root certificates
	// are used to validate the TLS connection.
	// +optional
	caBundle?: bytes @go(CABundle,[]byte)

	// The configuration used for client side related TLS communication, when the Vault server
	// requires mutual authentication. Only used if the Server URL is using HTTPS protocol.
	// This parameter is ignored for plain HTTP protocol connection.
	// It's worth noting this configuration is different from the "TLS certificates auth method",
	// which is available under the `auth.cert` section.
	// +optional
	tls?: #VaultClientTLS @go(ClientTLS)

	// The provider for the CA bundle to use to validate Vault server certificate.
	// +optional
	caProvider?: null | #CAProvider @go(CAProvider,*CAProvider)

	// ReadYourWrites ensures isolated read-after-write semantics by
	// providing discovered cluster replication states in each request.
	// More information about eventual consistency in Vault can be found here
	// https://www.vaultproject.io/docs/enterprise/consistency
	// +optional
	readYourWrites?: bool @go(ReadYourWrites)

	// ForwardInconsistent tells Vault to forward read-after-write requests to the Vault
	// leader instead of simply retrying within a loop. This can increase performance if
	// the option is enabled serverside.
	// https://www.vaultproject.io/docs/configuration/replication#allow_forwarding_via_header
	// +optional
	forwardInconsistent?: bool @go(ForwardInconsistent)

	// Headers to be added in Vault request
	// +optional
	headers?: {[string]: string} @go(Headers,map[string]string)
}

// VaultClientTLS is the configuration used for client side related TLS communication,
// when the Vault server requires mutual authentication.
#VaultClientTLS: {
	// CertSecretRef is a certificate added to the transport layer
	// when communicating with the Vault server.
	// If no key for the Secret is specified, external-secret will default to 'tls.crt'.
	certSecretRef?: null | esmeta.#SecretKeySelector @go(CertSecretRef,*esmeta.SecretKeySelector)

	// KeySecretRef to a key in a Secret resource containing client private key
	// added to the transport layer when communicating with the Vault server.
	// If no key for the Secret is specified, external-secret will default to 'tls.key'.
	keySecretRef?: null | esmeta.#SecretKeySelector @go(KeySecretRef,*esmeta.SecretKeySelector)
}

// VaultAuth is the configuration used to authenticate with a Vault server.
// Only one of `tokenSecretRef`, `appRole`,  `kubernetes`, `ldap`, `userPass`, `jwt` or `cert`
// can be specified. A namespace to authenticate against can optionally be specified.
#VaultAuth: {
	// Name of the vault namespace to authenticate to. This can be different than the namespace your secret is in.
	// Namespaces is a set of features within Vault Enterprise that allows
	// Vault environments to support Secure Multi-tenancy. e.g: "ns1".
	// More about namespaces can be found here https://www.vaultproject.io/docs/enterprise/namespaces
	// This will default to Vault.Namespace field if set, or empty otherwise
	// +optional
	namespace?: null | string @go(Namespace,*string)

	// TokenSecretRef authenticates with Vault by presenting a token.
	// +optional
	tokenSecretRef?: null | esmeta.#SecretKeySelector @go(TokenSecretRef,*esmeta.SecretKeySelector)

	// AppRole authenticates with Vault using the App Role auth mechanism,
	// with the role and secret stored in a Kubernetes Secret resource.
	// +optional
	appRole?: null | #VaultAppRole @go(AppRole,*VaultAppRole)

	// Kubernetes authenticates with Vault by passing the ServiceAccount
	// token stored in the named Secret resource to the Vault server.
	// +optional
	kubernetes?: null | #VaultKubernetesAuth @go(Kubernetes,*VaultKubernetesAuth)

	// Ldap authenticates with Vault by passing username/password pair using
	// the LDAP authentication method
	// +optional
	ldap?: null | #VaultLdapAuth @go(Ldap,*VaultLdapAuth)

	// Jwt authenticates with Vault by passing role and JWT token using the
	// JWT/OIDC authentication method
	// +optional
	jwt?: null | #VaultJwtAuth @go(Jwt,*VaultJwtAuth)

	// Cert authenticates with TLS Certificates by passing client certificate, private key and ca certificate
	// Cert authentication method
	// +optional
	cert?: null | #VaultCertAuth @go(Cert,*VaultCertAuth)

	// Iam authenticates with vault by passing a special AWS request signed with AWS IAM credentials
	// AWS IAM authentication method
	// +optional
	iam?: null | #VaultIamAuth @go(Iam,*VaultIamAuth)

	// UserPass authenticates with Vault by passing username/password pair
	// +optional
	userPass?: null | #VaultUserPassAuth @go(UserPass,*VaultUserPassAuth)
}

// VaultAppRole authenticates with Vault using the App Role auth mechanism,
// with the role and secret stored in a Kubernetes Secret resource.
#VaultAppRole: {
	// Path where the App Role authentication backend is mounted
	// in Vault, e.g: "approle"
	// +kubebuilder:default=approle
	path: string @go(Path)

	// RoleID configured in the App Role authentication backend when setting
	// up the authentication backend in Vault.
	//+optional
	roleId?: string @go(RoleID)

	// Reference to a key in a Secret that contains the App Role ID used
	// to authenticate with Vault.
	// The `key` field must be specified and denotes which entry within the Secret
	// resource is used as the app role id.
	//+optional
	roleRef?: null | esmeta.#SecretKeySelector @go(RoleRef,*esmeta.SecretKeySelector)

	// Reference to a key in a Secret that contains the App Role secret used
	// to authenticate with Vault.
	// The `key` field must be specified and denotes which entry within the Secret
	// resource is used as the app role secret.
	secretRef: esmeta.#SecretKeySelector @go(SecretRef)
}

// Authenticate against Vault using a Kubernetes ServiceAccount token stored in
// a Secret.
#VaultKubernetesAuth: {
	// Path where the Kubernetes authentication backend is mounted in Vault, e.g:
	// "kubernetes"
	// +kubebuilder:default=kubernetes
	mountPath: string @go(Path)

	// Optional service account field containing the name of a kubernetes ServiceAccount.
	// If the service account is specified, the service account secret token JWT will be used
	// for authenticating with Vault. If the service account selector is not supplied,
	// the secretRef will be used instead.
	// +optional
	serviceAccountRef?: null | esmeta.#ServiceAccountSelector @go(ServiceAccountRef,*esmeta.ServiceAccountSelector)

	// Optional secret field containing a Kubernetes ServiceAccount JWT used
	// for authenticating with Vault. If a name is specified without a key,
	// `token` is the default. If one is not specified, the one bound to
	// the controller will be used.
	// +optional
	secretRef?: null | esmeta.#SecretKeySelector @go(SecretRef,*esmeta.SecretKeySelector)

	// A required field containing the Vault Role to assume. A Role binds a
	// Kubernetes ServiceAccount with a set of Vault policies.
	role: string @go(Role)
}

// VaultLdapAuth authenticates with Vault using the LDAP authentication method,
// with the username and password stored in a Kubernetes Secret resource.
#VaultLdapAuth: {
	// Path where the LDAP authentication backend is mounted
	// in Vault, e.g: "ldap"
	// +kubebuilder:default=ldap
	path: string @go(Path)

	// Username is a LDAP user name used to authenticate using the LDAP Vault
	// authentication method
	username: string @go(Username)

	// SecretRef to a key in a Secret resource containing password for the LDAP
	// user used to authenticate with Vault using the LDAP authentication
	// method
	secretRef?: esmeta.#SecretKeySelector @go(SecretRef)
}

// VaultAwsAuth tells the controller how to do authentication with aws.
// Only one of secretRef or jwt can be specified.
// if none is specified the controller will try to load credentials from its own service account assuming it is IRSA enabled.
#VaultAwsAuth: {
	// +optional
	secretRef?: null | #VaultAwsAuthSecretRef @go(SecretRef,*VaultAwsAuthSecretRef)

	// +optional
	jwt?: null | #VaultAwsJWTAuth @go(JWTAuth,*VaultAwsJWTAuth)
}

// VaultAWSAuthSecretRef holds secret references for AWS credentials
// both AccessKeyID and SecretAccessKey must be defined in order to properly authenticate.
#VaultAwsAuthSecretRef: {
	// The AccessKeyID is used for authentication
	accessKeyIDSecretRef?: esmeta.#SecretKeySelector @go(AccessKeyID)

	// The SecretAccessKey is used for authentication
	secretAccessKeySecretRef?: esmeta.#SecretKeySelector @go(SecretAccessKey)

	// The SessionToken used for authentication
	// This must be defined if AccessKeyID and SecretAccessKey are temporary credentials
	// see: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html
	// +Optional
	sessionTokenSecretRef?: null | esmeta.#SecretKeySelector @go(SessionToken,*esmeta.SecretKeySelector)
}

// Authenticate against AWS using service account tokens.
#VaultAwsJWTAuth: {
	serviceAccountRef?: null | esmeta.#ServiceAccountSelector @go(ServiceAccountRef,*esmeta.ServiceAccountSelector)
}

// VaultKubernetesServiceAccountTokenAuth authenticates with Vault using a temporary
// Kubernetes service account token retrieved by the `TokenRequest` API.
#VaultKubernetesServiceAccountTokenAuth: {
	// Service account field containing the name of a kubernetes ServiceAccount.
	serviceAccountRef: esmeta.#ServiceAccountSelector @go(ServiceAccountRef)

	// Optional audiences field that will be used to request a temporary Kubernetes service
	// account token for the service account referenced by `serviceAccountRef`.
	// Defaults to a single audience `vault` it not specified.
	// Deprecated: use serviceAccountRef.Audiences instead
	// +optional
	audiences?: null | [...string] @go(Audiences,*[]string)

	// Optional expiration time in seconds that will be used to request a temporary
	// Kubernetes service account token for the service account referenced by
	// `serviceAccountRef`.
	// Deprecated: this will be removed in the future.
	// Defaults to 10 minutes.
	// +optional
	expirationSeconds?: null | int64 @go(ExpirationSeconds,*int64)
}

// VaultJwtAuth authenticates with Vault using the JWT/OIDC authentication
// method, with the role name and a token stored in a Kubernetes Secret resource or
// a Kubernetes service account token retrieved via `TokenRequest`.
#VaultJwtAuth: {
	// Path where the JWT authentication backend is mounted
	// in Vault, e.g: "jwt"
	// +kubebuilder:default=jwt
	path: string @go(Path)

	// Role is a JWT role to authenticate using the JWT/OIDC Vault
	// authentication method
	// +optional
	role?: string @go(Role)

	// Optional SecretRef that refers to a key in a Secret resource containing JWT token to
	// authenticate with Vault using the JWT/OIDC authentication method.
	// +optional
	secretRef?: null | esmeta.#SecretKeySelector @go(SecretRef,*esmeta.SecretKeySelector)

	// Optional ServiceAccountToken specifies the Kubernetes service account for which to request
	// a token for with the `TokenRequest` API.
	// +optional
	kubernetesServiceAccountToken?: null | #VaultKubernetesServiceAccountTokenAuth @go(KubernetesServiceAccountToken,*VaultKubernetesServiceAccountTokenAuth)
}

// VaultJwtAuth authenticates with Vault using the JWT/OIDC authentication
// method, with the role name and token stored in a Kubernetes Secret resource.
#VaultCertAuth: {
	// ClientCert is a certificate to authenticate using the Cert Vault
	// authentication method
	// +optional
	clientCert?: esmeta.#SecretKeySelector @go(ClientCert)

	// SecretRef to a key in a Secret resource containing client private key to
	// authenticate with Vault using the Cert authentication method
	secretRef?: esmeta.#SecretKeySelector @go(SecretRef)
}

// VaultIamAuth authenticates with Vault using the Vault's AWS IAM authentication method. Refer: https://developer.hashicorp.com/vault/docs/auth/aws
#VaultIamAuth: {
	// Path where the AWS auth method is enabled in Vault, e.g: "aws"
	path?: string @go(Path)

	// AWS region
	region?: string @go(Region)

	// This is the AWS role to be assumed before talking to vault
	role?: string @go(AWSIAMRole)

	// Vault Role. In vault, a role describes an identity with a set of permissions, groups, or policies you want to attach a user of the secrets engine
	vaultRole: string @go(Role)

	// AWS External ID set on assumed IAM roles
	externalID?: string @go(ExternalID)

	// X-Vault-AWS-IAM-Server-ID is an additional header used by Vault IAM auth method to mitigate against different types of replay attacks. More details here: https://developer.hashicorp.com/vault/docs/auth/aws
	vaultAwsIamServerID?: string @go(VaultAWSIAMServerID)

	// Specify credentials in a Secret object
	// +optional
	secretRef?: null | #VaultAwsAuthSecretRef @go(SecretRef,*VaultAwsAuthSecretRef)

	// Specify a service account with IRSA enabled
	// +optional
	jwt?: null | #VaultAwsJWTAuth @go(JWTAuth,*VaultAwsJWTAuth)
}

// VaultUserPassAuth authenticates with Vault using UserPass authentication method,
// with the username and password stored in a Kubernetes Secret resource.
#VaultUserPassAuth: {
	// Path where the UserPassword authentication backend is mounted
	// in Vault, e.g: "user"
	// +kubebuilder:default=user
	path: string @go(Path)

	// Username is a user name used to authenticate using the UserPass Vault
	// authentication method
	username: string @go(Username)

	// SecretRef to a key in a Secret resource containing password for the
	// user used to authenticate with Vault using the UserPass authentication
	// method
	secretRef?: esmeta.#SecretKeySelector @go(SecretRef)
}
