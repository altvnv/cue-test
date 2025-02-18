// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane/crossplane/apis/pkg/v1

package v1

// PackageRuntimeSpec specifies configuration for the runtime of a package.
// Only used by packages that uses a runtime, i.e. by providers and functions
// but not for configurations.
#PackageRuntimeSpec: {
	// ControllerConfigRef references a ControllerConfig resource that will be
	// used to configure the packaged controller Deployment.
	// Deprecated: Use RuntimeConfigReference instead.
	// +optional
	controllerConfigRef?: null | #ControllerConfigReference @go(ControllerConfigReference,*ControllerConfigReference)

	// RuntimeConfigRef references a RuntimeConfig resource that will be used
	// to configure the package runtime.
	// +optional
	// +kubebuilder:default={"name": "default"}
	runtimeConfigRef?: null | #RuntimeConfigReference @go(RuntimeConfigReference,*RuntimeConfigReference)
}

// PackageRevisionRuntimeSpec specifies configuration for the runtime of a
// package revision. Only used by packages that uses a runtime, i.e. by
// providers and functions but not for configurations.
#PackageRevisionRuntimeSpec: {
	#PackageRuntimeSpec

	// TLSServerSecretName is the name of the TLS Secret that stores server
	// certificates of the Provider.
	// +optional
	tlsServerSecretName?: null | string @go(TLSServerSecretName,*string)

	// TLSClientSecretName is the name of the TLS Secret that stores client
	// certificates of the Provider.
	// +optional
	tlsClientSecretName?: null | string @go(TLSClientSecretName,*string)
}

// A ControllerConfigReference to a ControllerConfig resource that will be used
// to configure the packaged controller Deployment.
#ControllerConfigReference: {
	// Name of the ControllerConfig.
	name: string @go(Name)
}

// A RuntimeConfigReference to a runtime config resource that will be used
// to configure the package runtime.
#RuntimeConfigReference: {
	// API version of the referent.
	// +optional
	// +kubebuilder:default="pkg.crossplane.io/v1beta1"
	apiVersion?: null | string @go(APIVersion,*string)

	// Kind of the referent.
	// +optional
	// +kubebuilder:default="DeploymentRuntimeConfig"
	kind?: null | string @go(Kind,*string)

	// Name of the RuntimeConfig.
	name: string @go(Name)
}
