// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// ProxyStatistics Statistics of a set of proxy redirects for an endpoint
//
// +k8s:deepcopy-gen=true
//
// swagger:model ProxyStatistics
#ProxyStatistics: {
	// The port the proxy is listening on
	"allocated-proxy-port"?: int64 @go(AllocatedProxyPort)

	// Location of where the redirect is installed
	// Enum: [ingress egress]
	location?: string @go(Location)

	// The port subject to the redirect
	port?: int64 @go(Port)

	// Name of the L7 protocol
	protocol?: string @go(Protocol)

	// Statistics of this set of proxy redirect
	statistics?: null | #RequestResponseStatistics @go(Statistics,*RequestResponseStatistics)
}

// ProxyStatisticsLocationIngress captures enum value "ingress"
#ProxyStatisticsLocationIngress: "ingress"

// ProxyStatisticsLocationEgress captures enum value "egress"
#ProxyStatisticsLocationEgress: "egress"
