// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// BgpPath Single BGP routing Path containing BGP Network Layer Reachability Information (NLRI) and path attributes
//
// swagger:model BgpPath
#BgpPath: {
	// Age of the path (time since its creation) in nanoseconds
	"age-nanoseconds"?: int64 @go(AgeNanoseconds)

	// True value flags the best path towards the destination prefix
	best?: bool @go(Best)

	// Address Family Indicator (AFI) and Subsequent Address Family Indicator (SAFI) of the path
	family?: null | #BgpFamily @go(Family,*BgpFamily)

	// Network Layer Reachability Information of the path
	nlri?: null | #BgpNlri @go(Nlri,*BgpNlri)

	// List of BGP path attributes specific for the path
	"path-attributes": [...null | #BgpPathAttribute] @go(PathAttributes,[]*BgpPathAttribute)

	// True value marks the path as stale
	stale?: bool @go(Stale)
}
