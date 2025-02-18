// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#InstanceIAMMemberConditionInitParameters: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#InstanceIAMMemberConditionObservation: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#InstanceIAMMemberConditionParameters: {
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// +kubebuilder:validation:Optional
	expression?: null | string @go(Expression,*string)

	// +kubebuilder:validation:Optional
	title?: null | string @go(Title,*string)
}

#InstanceIAMMemberInitParameters: {
	condition?: [...#InstanceIAMMemberConditionInitParameters] @go(Condition,[]InstanceIAMMemberConditionInitParameters)
	member?:  null | string @go(Member,*string)
	project?: null | string @go(Project,*string)
	role?:    null | string @go(Role,*string)
	zone?:    null | string @go(Zone,*string)
}

#InstanceIAMMemberObservation: {
	condition?: [...#InstanceIAMMemberConditionObservation] @go(Condition,[]InstanceIAMMemberConditionObservation)
	etag?:         null | string @go(Etag,*string)
	id?:           null | string @go(ID,*string)
	instanceName?: null | string @go(InstanceName,*string)
	member?:       null | string @go(Member,*string)
	project?:      null | string @go(Project,*string)
	role?:         null | string @go(Role,*string)
	zone?:         null | string @go(Zone,*string)
}

#InstanceIAMMemberParameters: {
	// +kubebuilder:validation:Optional
	condition?: [...#InstanceIAMMemberConditionParameters] @go(Condition,[]InstanceIAMMemberConditionParameters)

	// +crossplane:generate:reference:type=Instance
	// +kubebuilder:validation:Optional
	instanceName?: null | string @go(InstanceName,*string)

	// Reference to a Instance to populate instanceName.
	// +kubebuilder:validation:Optional
	instanceNameRef?: null | v1.#Reference @go(InstanceNameRef,*v1.Reference)

	// Selector for a Instance to populate instanceName.
	// +kubebuilder:validation:Optional
	instanceNameSelector?: null | v1.#Selector @go(InstanceNameSelector,*v1.Selector)

	// +kubebuilder:validation:Optional
	member?: null | string @go(Member,*string)

	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// +kubebuilder:validation:Optional
	role?: null | string @go(Role,*string)

	// +kubebuilder:validation:Optional
	zone?: null | string @go(Zone,*string)
}

// InstanceIAMMemberSpec defines the desired state of InstanceIAMMember
#InstanceIAMMemberSpec: {
	v1.#ResourceSpec
	forProvider: #InstanceIAMMemberParameters @go(ForProvider)

	// THIS IS AN ALPHA FIELD. Do not use it in production. It is not honored
	// unless the relevant Crossplane feature flag is enabled, and may be
	// changed or removed without notice.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #InstanceIAMMemberInitParameters @go(InitProvider)
}

// InstanceIAMMemberStatus defines the observed state of InstanceIAMMember.
#InstanceIAMMemberStatus: {
	v1.#ResourceStatus
	atProvider?: #InstanceIAMMemberObservation @go(AtProvider)
}

// InstanceIAMMember is the Schema for the InstanceIAMMembers API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#InstanceIAMMember: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.member) || (has(self.initProvider) && has(self.initProvider.member))",message="spec.forProvider.member is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.role) || (has(self.initProvider) && has(self.initProvider.role))",message="spec.forProvider.role is a required parameter"
	spec:    #InstanceIAMMemberSpec   @go(Spec)
	status?: #InstanceIAMMemberStatus @go(Status)
}

// InstanceIAMMemberList contains a list of InstanceIAMMembers
#InstanceIAMMemberList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#InstanceIAMMember] @go(Items,[]InstanceIAMMember)
}
