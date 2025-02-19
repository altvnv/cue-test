// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-vault/apis/identity/v1alpha1

package v1alpha1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#GroupInitParameters: {
	// false by default. If set to true, this resource will ignore any Entity IDs
	// returned from Vault or specified in the resource. You can use
	// vault_identity_group_member_entity_ids to manage Entity IDs for this group in a
	// decoupled manner.
	// Manage member entities externally through `vault_identity_group_member_entity_ids`
	externalMemberEntityIds?: null | bool @go(ExternalMemberEntityIds,*bool)

	// false by default. If set to true, this resource will ignore any Group IDs
	// returned from Vault or specified in the resource. You can use
	// vault_identity_group_member_group_ids to manage Group IDs for this group in a
	// decoupled manner.
	// Manage member groups externally through `vault_identity_group_member_group_ids`
	externalMemberGroupIds?: null | bool @go(ExternalMemberGroupIds,*bool)

	// false by default. If set to true, this resource will ignore any policies returned from
	// Vault or specified in the resource. You can use vault_identity_group_policies to manage
	// policies for this group in a decoupled manner.
	// Manage policies externally through `vault_identity_group_policies`, allows using group ID in assigned policies.
	externalPolicies?: null | bool @go(ExternalPolicies,*bool)

	// A list of Entity IDs to be assigned as group members. Not allowed on external groups.
	// Entity IDs to be assigned as group members.
	memberEntityIds?: [...null | string] @go(MemberEntityIds,[]*string)

	// A list of Group IDs to be assigned as group members. Not allowed on external groups.
	// Group IDs to be assigned as group members.
	memberGroupIds?: [...null | string] @go(MemberGroupIds,[]*string)

	// A Map of additional metadata to associate with the group.
	// Metadata to be associated with the group.
	metadata?: {[string]: null | string} @go(Metadata,map[string]*string)

	// Name of the identity group to create.
	// Name of the group.
	name?: null | string @go(Name,*string)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// A list of policies to apply to the group.
	// Policies to be tied to the group.
	policies?: [...null | string] @go(Policies,[]*string)

	// Type of the group, internal or external. Defaults to internal.
	// Type of the group, internal or external. Defaults to internal.
	type?: null | string @go(Type,*string)
}

#GroupObservation: {
	// false by default. If set to true, this resource will ignore any Entity IDs
	// returned from Vault or specified in the resource. You can use
	// vault_identity_group_member_entity_ids to manage Entity IDs for this group in a
	// decoupled manner.
	// Manage member entities externally through `vault_identity_group_member_entity_ids`
	externalMemberEntityIds?: null | bool @go(ExternalMemberEntityIds,*bool)

	// false by default. If set to true, this resource will ignore any Group IDs
	// returned from Vault or specified in the resource. You can use
	// vault_identity_group_member_group_ids to manage Group IDs for this group in a
	// decoupled manner.
	// Manage member groups externally through `vault_identity_group_member_group_ids`
	externalMemberGroupIds?: null | bool @go(ExternalMemberGroupIds,*bool)

	// false by default. If set to true, this resource will ignore any policies returned from
	// Vault or specified in the resource. You can use vault_identity_group_policies to manage
	// policies for this group in a decoupled manner.
	// Manage policies externally through `vault_identity_group_policies`, allows using group ID in assigned policies.
	externalPolicies?: null | bool @go(ExternalPolicies,*bool)

	// The id of the created group.
	id?: null | string @go(ID,*string)

	// A list of Entity IDs to be assigned as group members. Not allowed on external groups.
	// Entity IDs to be assigned as group members.
	memberEntityIds?: [...null | string] @go(MemberEntityIds,[]*string)

	// A list of Group IDs to be assigned as group members. Not allowed on external groups.
	// Group IDs to be assigned as group members.
	memberGroupIds?: [...null | string] @go(MemberGroupIds,[]*string)

	// A Map of additional metadata to associate with the group.
	// Metadata to be associated with the group.
	metadata?: {[string]: null | string} @go(Metadata,map[string]*string)

	// Name of the identity group to create.
	// Name of the group.
	name?: null | string @go(Name,*string)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// A list of policies to apply to the group.
	// Policies to be tied to the group.
	policies?: [...null | string] @go(Policies,[]*string)

	// Type of the group, internal or external. Defaults to internal.
	// Type of the group, internal or external. Defaults to internal.
	type?: null | string @go(Type,*string)
}

#GroupParameters: {
	// false by default. If set to true, this resource will ignore any Entity IDs
	// returned from Vault or specified in the resource. You can use
	// vault_identity_group_member_entity_ids to manage Entity IDs for this group in a
	// decoupled manner.
	// Manage member entities externally through `vault_identity_group_member_entity_ids`
	// +kubebuilder:validation:Optional
	externalMemberEntityIds?: null | bool @go(ExternalMemberEntityIds,*bool)

	// false by default. If set to true, this resource will ignore any Group IDs
	// returned from Vault or specified in the resource. You can use
	// vault_identity_group_member_group_ids to manage Group IDs for this group in a
	// decoupled manner.
	// Manage member groups externally through `vault_identity_group_member_group_ids`
	// +kubebuilder:validation:Optional
	externalMemberGroupIds?: null | bool @go(ExternalMemberGroupIds,*bool)

	// false by default. If set to true, this resource will ignore any policies returned from
	// Vault or specified in the resource. You can use vault_identity_group_policies to manage
	// policies for this group in a decoupled manner.
	// Manage policies externally through `vault_identity_group_policies`, allows using group ID in assigned policies.
	// +kubebuilder:validation:Optional
	externalPolicies?: null | bool @go(ExternalPolicies,*bool)

	// A list of Entity IDs to be assigned as group members. Not allowed on external groups.
	// Entity IDs to be assigned as group members.
	// +kubebuilder:validation:Optional
	memberEntityIds?: [...null | string] @go(MemberEntityIds,[]*string)

	// A list of Group IDs to be assigned as group members. Not allowed on external groups.
	// Group IDs to be assigned as group members.
	// +kubebuilder:validation:Optional
	memberGroupIds?: [...null | string] @go(MemberGroupIds,[]*string)

	// A Map of additional metadata to associate with the group.
	// Metadata to be associated with the group.
	// +kubebuilder:validation:Optional
	metadata?: {[string]: null | string} @go(Metadata,map[string]*string)

	// Name of the identity group to create.
	// Name of the group.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	// +kubebuilder:validation:Optional
	namespace?: null | string @go(Namespace,*string)

	// A list of policies to apply to the group.
	// Policies to be tied to the group.
	// +kubebuilder:validation:Optional
	policies?: [...null | string] @go(Policies,[]*string)

	// Type of the group, internal or external. Defaults to internal.
	// Type of the group, internal or external. Defaults to internal.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

// GroupSpec defines the desired state of Group
#GroupSpec: {
	v1.#ResourceSpec
	forProvider: #GroupParameters @go(ForProvider)

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
	initProvider?: #GroupInitParameters @go(InitProvider)
}

// GroupStatus defines the observed state of Group.
#GroupStatus: {
	v1.#ResourceStatus
	atProvider?: #GroupObservation @go(AtProvider)
}

// Group is the Schema for the Groups API. Creates an Identity Group for Vault.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,vault}
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
