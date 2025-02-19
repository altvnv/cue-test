// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go sigs.k8s.io/gateway-api/apis/v1

package v1

// LocalObjectReference identifies an API object within the namespace of the
// referrer.
// The API object must be valid in the cluster; the Group and Kind must
// be registered in the cluster for this reference to be valid.
//
// References to objects with invalid Group and Kind are not valid, and must
// be rejected by the implementation, with appropriate Conditions set
// on the containing object.
#LocalObjectReference: {
	// Group is the group of the referent. For example, "gateway.networking.k8s.io".
	// When unspecified or empty string, core API group is inferred.
	group: #Group @go(Group)

	// Kind is kind of the referent. For example "HTTPRoute" or "Service".
	kind: #Kind @go(Kind)

	// Name is the name of the referent.
	name: #ObjectName @go(Name)
}

// SecretObjectReference identifies an API object including its namespace,
// defaulting to Secret.
//
// The API object must be valid in the cluster; the Group and Kind must
// be registered in the cluster for this reference to be valid.
//
// References to objects with invalid Group and Kind are not valid, and must
// be rejected by the implementation, with appropriate Conditions set
// on the containing object.
#SecretObjectReference: {
	// Group is the group of the referent. For example, "gateway.networking.k8s.io".
	// When unspecified or empty string, core API group is inferred.
	//
	// +optional
	// +kubebuilder:default=""
	group?: null | #Group @go(Group,*Group)

	// Kind is kind of the referent. For example "Secret".
	//
	// +optional
	// +kubebuilder:default=Secret
	kind?: null | #Kind @go(Kind,*Kind)

	// Name is the name of the referent.
	name: #ObjectName @go(Name)

	// Namespace is the namespace of the referenced object. When unspecified, the local
	// namespace is inferred.
	//
	// Note that when a namespace different than the local namespace is specified,
	// a ReferenceGrant object is required in the referent namespace to allow that
	// namespace's owner to accept the reference. See the ReferenceGrant
	// documentation for details.
	//
	// Support: Core
	//
	// +optional
	namespace?: null | #Namespace @go(Namespace,*Namespace)
}

// BackendObjectReference defines how an ObjectReference that is
// specific to BackendRef. It includes a few additional fields and features
// than a regular ObjectReference.
//
// Note that when a namespace different than the local namespace is specified, a
// ReferenceGrant object is required in the referent namespace to allow that
// namespace's owner to accept the reference. See the ReferenceGrant
// documentation for details.
//
// The API object must be valid in the cluster; the Group and Kind must
// be registered in the cluster for this reference to be valid.
//
// References to objects with invalid Group and Kind are not valid, and must
// be rejected by the implementation, with appropriate Conditions set
// on the containing object.
//
// +kubebuilder:validation:XValidation:message="Must have port for Service reference",rule="(size(self.group) == 0 && self.kind == 'Service') ? has(self.port) : true"
#BackendObjectReference: {
	// Group is the group of the referent. For example, "gateway.networking.k8s.io".
	// When unspecified or empty string, core API group is inferred.
	//
	// +optional
	// +kubebuilder:default=""
	group?: null | #Group @go(Group,*Group)

	// Kind is the Kubernetes resource kind of the referent. For example
	// "Service".
	//
	// Defaults to "Service" when not specified.
	//
	// ExternalName services can refer to CNAME DNS records that may live
	// outside of the cluster and as such are difficult to reason about in
	// terms of conformance. They also may not be safe to forward to (see
	// CVE-2021-25740 for more information). Implementations SHOULD NOT
	// support ExternalName Services.
	//
	// Support: Core (Services with a type other than ExternalName)
	//
	// Support: Implementation-specific (Services with type ExternalName)
	//
	// +optional
	// +kubebuilder:default=Service
	kind?: null | #Kind @go(Kind,*Kind)

	// Name is the name of the referent.
	name: #ObjectName @go(Name)

	// Namespace is the namespace of the backend. When unspecified, the local
	// namespace is inferred.
	//
	// Note that when a namespace different than the local namespace is specified,
	// a ReferenceGrant object is required in the referent namespace to allow that
	// namespace's owner to accept the reference. See the ReferenceGrant
	// documentation for details.
	//
	// Support: Core
	//
	// +optional
	namespace?: null | #Namespace @go(Namespace,*Namespace)

	// Port specifies the destination port number to use for this resource.
	// Port is required when the referent is a Kubernetes Service. In this
	// case, the port number is the service port number, not the target port.
	// For other resources, destination port might be derived from the referent
	// resource or this field.
	//
	// +optional
	port?: null | #PortNumber @go(Port,*PortNumber)
}

// ObjectReference identifies an API object including its namespace.
//
// The API object must be valid in the cluster; the Group and Kind must
// be registered in the cluster for this reference to be valid.
//
// References to objects with invalid Group and Kind are not valid, and must
// be rejected by the implementation, with appropriate Conditions set
// on the containing object.
#ObjectReference: {
	// Group is the group of the referent. For example, "gateway.networking.k8s.io".
	// When unspecified or empty string, core API group is inferred.
	group: #Group @go(Group)

	// Kind is kind of the referent. For example "ConfigMap" or "Service".
	kind: #Kind @go(Kind)

	// Name is the name of the referent.
	name: #ObjectName @go(Name)

	// Namespace is the namespace of the referenced object. When unspecified, the local
	// namespace is inferred.
	//
	// Note that when a namespace different than the local namespace is specified,
	// a ReferenceGrant object is required in the referent namespace to allow that
	// namespace's owner to accept the reference. See the ReferenceGrant
	// documentation for details.
	//
	// Support: Core
	//
	// +optional
	namespace?: null | #Namespace @go(Namespace,*Namespace)
}
