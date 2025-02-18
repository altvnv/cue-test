// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// NamedPorts List of named Layer 4 port and protocol pairs which will be used in Network
// Policy specs.
//
// +deepequal-gen=true
// +k8s:deepcopy-gen=true
//
// swagger:model NamedPorts
#NamedPorts: [...null | #Port]
