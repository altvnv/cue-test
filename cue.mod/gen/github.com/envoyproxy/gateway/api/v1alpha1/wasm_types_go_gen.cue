// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/envoyproxy/gateway/api/v1alpha1

package v1alpha1

import (
	apiextensionsv1 "k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/v1"
	gwapiv1 "sigs.k8s.io/gateway-api/apis/v1"
)

// Wasm defines a Wasm extension.
//
// Note: at the moment, Envoy Gateway does not support configuring Wasm runtime.
// v8 is used as the VM runtime for the Wasm extensions.
#Wasm: {
	// Name is a unique name for this Wasm extension. It is used to identify the
	// Wasm extension if multiple extensions are handled by the same vm_id and root_id.
	// It's also used for logging/debugging.
	// If not specified, EG will generate a unique name for the Wasm extension.
	//
	// +optional
	name?: null | string @go(Name,*string)

	// RootID is a unique ID for a set of extensions in a VM which will share a
	// RootContext and Contexts if applicable (e.g., an Wasm HttpFilter and an Wasm AccessLog).
	// If left blank, all extensions with a blank root_id with the same vm_id will share Context(s).
	//
	// Note: RootID must match the root_id parameter used to register the Context in the Wasm code.
	rootID?: null | string @go(RootID,*string)

	// Code is the Wasm code for the extension.
	code: #WasmCodeSource @go(Code)

	// Config is the configuration for the Wasm extension.
	// This configuration will be passed as a JSON string to the Wasm extension.
	// +optional
	config?: null | apiextensionsv1.#JSON @go(Config,*apiextensionsv1.JSON)

	// FailOpen is a switch used to control the behavior when a fatal error occurs
	// during the initialization or the execution of the Wasm extension.
	// If FailOpen is set to true, the system bypasses the Wasm extension and
	// allows the traffic to pass through. Otherwise, if it is set to false or
	// not set (defaulting to false), the system blocks the traffic and returns
	// an HTTP 5xx error.
	//
	// +optional
	// +kubebuilder:default=false
	failOpen?: null | bool @go(FailOpen,*bool)
}

// WasmCodeSource defines the source of the Wasm code.
// +union
//
// +kubebuilder:validation:XValidation:rule="self.type == 'HTTP' ? has(self.http) : !has(self.http)",message="If type is HTTP, http field needs to be set."
// +kubebuilder:validation:XValidation:rule="self.type == 'Image' ? has(self.image) : !has(self.image)",message="If type is Image, image field needs to be set."
#WasmCodeSource: {
	// Type is the type of the source of the Wasm code.
	// Valid WasmCodeSourceType values are "HTTP" or "Image".
	//
	// +kubebuilder:validation:Enum=HTTP;Image;ConfigMap
	// +unionDiscriminator
	type: #WasmCodeSourceType @go(Type)

	// HTTP is the HTTP URL containing the Wasm code.
	//
	// Note that the HTTP server must be accessible from the Envoy proxy.
	// +optional
	http?: null | #HTTPWasmCodeSource @go(HTTP,*HTTPWasmCodeSource)

	// Image is the OCI image containing the Wasm code.
	//
	// Note that the image must be accessible from the Envoy Gateway.
	// +optional
	image?: null | #ImageWasmCodeSource @go(Image,*ImageWasmCodeSource)

	// PullPolicy is the policy to use when pulling the Wasm module by either the HTTP or Image source.
	// This field is only applicable when the SHA256 field is not set.
	//
	// If not specified, the default policy is IfNotPresent except for OCI images whose tag is latest.
	//
	// Note: EG does not update the Wasm module every time an Envoy proxy requests
	// the Wasm module even if the pull policy is set to Always.
	// It only updates the Wasm module when the EnvoyExtension resource version changes.
	// +optional
	pullPolicy?: null | #ImagePullPolicy @go(PullPolicy,*ImagePullPolicy)
}

// WasmCodeSourceType specifies the types of sources for the Wasm code.
// +kubebuilder:validation:Enum=HTTP;Image
#WasmCodeSourceType: string // #enumWasmCodeSourceType

#enumWasmCodeSourceType:
	#HTTPWasmCodeSourceType |
	#ImageWasmCodeSourceType

// HTTPWasmCodeSourceType allows the user to specify the Wasm code in an HTTP URL.
#HTTPWasmCodeSourceType: #WasmCodeSourceType & "HTTP"

// ImageWasmCodeSourceType allows the user to specify the Wasm code in an OCI image.
#ImageWasmCodeSourceType: #WasmCodeSourceType & "Image"

// HTTPWasmCodeSource defines the HTTP URL containing the Wasm code.
#HTTPWasmCodeSource: {
	// URL is the URL containing the Wasm code.
	// +kubebuilder:validation:Pattern=`^((https?:)(\/\/\/?)([\w]*(?::[\w]*)?@)?([\d\w\.-]+)(?::(\d+))?)?([\/\\\w\.()-]*)?(?:([?][^#]*)?(#.*)?)*`
	url: string @go(URL)

	// SHA256 checksum that will be used to verify the Wasm code.
	//
	// If not specified, Envoy Gateway will not verify the downloaded Wasm code.
	// kubebuilder:validation:Pattern=`^[a-f0-9]{64}$`
	// +optional
	sha256?: null | string @go(SHA256,*string)
}

// ImageWasmCodeSource defines the OCI image containing the Wasm code.
#ImageWasmCodeSource: {
	// URL is the URL of the OCI image.
	// URL can be in the format of `registry/image:tag` or `registry/image@sha256:digest`.
	url: string @go(URL)

	// SHA256 checksum that will be used to verify the OCI image.
	//
	// It must match the digest of the OCI image.
	//
	// If not specified, Envoy Gateway will not verify the downloaded OCI image.
	// kubebuilder:validation:Pattern=`^[a-f0-9]{64}$`
	// +optional
	sha256?: null | string @go(SHA256,*string)

	// PullSecretRef is a reference to the secret containing the credentials to pull the image.
	// Only support Kubernetes Secret resource from the same namespace.
	// +kubebuilder:validation:XValidation:message="only support Secret kind.",rule="self.kind == 'Secret'"
	// +optional
	pullSecretRef?: null | gwapiv1.#SecretObjectReference @go(PullSecretRef,*gwapiv1.SecretObjectReference)
}

// ImagePullPolicy defines the policy to use when pulling an OIC image.
// +kubebuilder:validation:Enum=IfNotPresent;Always
#ImagePullPolicy: string // #enumImagePullPolicy

#enumImagePullPolicy:
	#ImagePullPolicyIfNotPresent |
	#ImagePullPolicyAlways

// ImagePullPolicyIfNotPresent will only pull the image if it does not already exist in the EG cache.
#ImagePullPolicyIfNotPresent: #ImagePullPolicy & "IfNotPresent"

// ImagePullPolicyAlways will pull the image when the EnvoyExtension resource version changes.
// Note: EG does not update the Wasm module every time an Envoy proxy requests the Wasm module.
#ImagePullPolicyAlways: #ImagePullPolicy & "Always"
