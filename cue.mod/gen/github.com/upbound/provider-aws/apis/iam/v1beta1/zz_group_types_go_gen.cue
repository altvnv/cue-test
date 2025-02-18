// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/iam/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#GroupInitParameters: {
	// Path in which to create the group.
	path?: null | string @go(Path,*string)
}

#GroupObservation: {
	// The ARN assigned by AWS for this group.
	arn?: null | string @go(Arn,*string)

	// The group's name.
	id?: null | string @go(ID,*string)

	// Path in which to create the group.
	path?: null | string @go(Path,*string)

	// The unique ID assigned by AWS.
	uniqueId?: null | string @go(UniqueID,*string)
}

#GroupParameters: {
	// Path in which to create the group.
	// +kubebuilder:validation:Optional
	path?: null | string @go(Path,*string)
}

// GroupSpec defines the desired state of Group
#GroupSpec: {
	v1.#ResourceSpec
	forProvider: #GroupParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #GroupInitParameters @go(InitProvider)
}

// GroupStatus defines the observed state of Group.
#GroupStatus: {
	v1.#ResourceStatus
	atProvider?: #GroupObservation @go(AtProvider)
}

// Group is the Schema for the Groups API. Provides an IAM group.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Group: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #GroupSpec         @go(Spec)
	status?:   #GroupStatus       @go(Status)
}

// GroupList contains a list of Groups
#GroupList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Group] @go(Items,[]Group)
}
