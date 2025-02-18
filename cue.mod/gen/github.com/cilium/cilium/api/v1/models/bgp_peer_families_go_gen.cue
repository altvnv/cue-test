// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// BgpPeerFamilies BGP AFI SAFI state of the peer
//
// +k8s:deepcopy-gen=true
//
// swagger:model BgpPeerFamilies
#BgpPeerFamilies: {
	// Number of routes accepted from the peer of this address family
	accepted?: int64 @go(Accepted)

	// Number of routes advertised of this address family to the peer
	advertised?: int64 @go(Advertised)

	// BGP address family indicator
	afi?: string @go(Afi)

	// Number of routes received from the peer of this address family
	received?: int64 @go(Received)

	// BGP subsequent address family indicator
	safi?: string @go(Safi)
}
