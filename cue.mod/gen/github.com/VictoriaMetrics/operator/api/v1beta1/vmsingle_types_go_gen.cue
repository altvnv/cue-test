// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/VictoriaMetrics/operator/api/v1beta1

package v1beta1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

#SingleStatusExpanding:   #SingleStatus & "expanding"
#SingleStatusOperational: #SingleStatus & "operational"
#SingleStatusFailed:      #SingleStatus & "failed"

#SingleStatus: string // #enumSingleStatus

#enumSingleStatus:
	#SingleStatusExpanding |
	#SingleStatusOperational |
	#SingleStatusFailed

// VMSingleSpec defines the desired state of VMSingle
// +k8s:openapi-gen=true
// +kubebuilder:printcolumn:name="Version",type="string",JSONPath=".spec.version",description="The version of VMSingle"
// +kubebuilder:printcolumn:name="RetentionPeriod",type="string",JSONPath=".spec.RetentionPeriod",description="The desired RetentionPeriod for vm single"
// +kubebuilder:printcolumn:name="Age",type="date",JSONPath=".metadata.creationTimestamp"
#VMSingleSpec: _

// VMSingleStatus defines the observed state of VMSingle
// +k8s:openapi-gen=true
#VMSingleStatus: {
	// ReplicaCount Total number of non-terminated pods targeted by this VMSingle.
	replicas: int32 @go(Replicas)

	// UpdatedReplicas Total number of non-terminated pods targeted by this VMSingle.
	updatedReplicas: int32 @go(UpdatedReplicas)

	// AvailableReplicas Total number of available pods (ready for at least minReadySeconds) targeted by this VMSingle.
	availableReplicas: int32 @go(AvailableReplicas)

	// UnavailableReplicas Total number of unavailable pods targeted by this VMSingle.
	unavailableReplicas: int32         @go(UnavailableReplicas)
	singleStatus:        #SingleStatus @go(SingleStatus)
	reason?:             string        @go(Reason)
}

// VMSingle  is fast, cost-effective and scalable time-series database.
// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object
// +operator-sdk:gen-csv:customresourcedefinitions.displayName="VMSingle App"
// +operator-sdk:gen-csv:customresourcedefinitions.resources="Deployment,apps"
// +operator-sdk:gen-csv:customresourcedefinitions.resources="Service,v1"
// +operator-sdk:gen-csv:customresourcedefinitions.resources="Secret,v1"
// +genclient
// +k8s:openapi-gen=true
// +kubebuilder:subresource:status
// +kubebuilder:resource:path=vmsingles,scope=Namespaced
// +kubebuilder:printcolumn:name="Status",type="string",JSONPath=".status.singleStatus",description="Current status of single node"
#VMSingle: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #VMSingleSpec      @go(Spec)
	status?:   #VMSingleStatus    @go(Status)
}

// VMSingleList contains a list of VMSingle
// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object
#VMSingleList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#VMSingle] @go(Items,[]VMSingle)
}
