// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// BgpGracefulRestart BGP graceful restart parameters negotiated with the peer.
//
// +k8s:deepcopy-gen=true
//
// swagger:model BgpGracefulRestart
#BgpGracefulRestart: {
	// When set, graceful restart capability is negotiated for all AFI/SAFIs of
	// this peer.
	enabled?: bool @go(Enabled)

	// This is the time advertised to peer for the BGP session to be re-established
	// after a restart. After this period, peer will remove stale routes.
	// (RFC 4724 section 4.2)
	"restart-time-seconds"?: int64 @go(RestartTimeSeconds)
}
