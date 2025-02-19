// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// BPFMapStatus BPF map status
//
// +k8s:deepcopy-gen=true
//
// swagger:model BPFMapStatus
#BPFMapStatus: {
	// Ratio of total system memory to use for dynamic sizing of BPF maps
	"dynamic-size-ratio"?: float64 @go(DynamicSizeRatio)

	// BPF maps
	maps: [...null | #BPFMapProperties] @go(Maps,[]*BPFMapProperties)
}
