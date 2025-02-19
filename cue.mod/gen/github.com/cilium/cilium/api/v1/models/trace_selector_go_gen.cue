// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// TraceSelector Context describing a pair of source and destination identity
//
// swagger:model TraceSelector
#TraceSelector: {
	// from
	from?: null | #TraceFrom @go(From,*TraceFrom)

	// to
	to?: null | #TraceTo @go(To,*TraceTo)

	// Enable verbose tracing.
	//
	verbose?: bool @go(Verbose)
}
