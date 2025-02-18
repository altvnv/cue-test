// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/open-telemetry/opentelemetry-operator/apis/v1beta1

package v1beta1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// TargetAllocatorPrometheusCR configures Prometheus CustomResource handling in the Target Allocator.
#TargetAllocatorPrometheusCR: {
	// Enabled indicates whether to use a PrometheusOperator custom resources as targets or not.
	// +optional
	enabled?: bool @go(Enabled)

	// Default interval between consecutive scrapes. Intervals set in ServiceMonitors and PodMonitors override it.
	//Equivalent to the same setting on the Prometheus CR.
	//
	// Default: "30s"
	// +kubebuilder:default:="30s"
	// +kubebuilder:validation:Format:=duration
	scrapeInterval?: null | metav1.#Duration @go(ScrapeInterval,*metav1.Duration)

	// PodMonitors to be selected for target discovery.
	// A label selector is a label query over a set of resources. The result of matchLabels and
	// matchExpressions are ANDed. An empty label selector matches all objects. A null
	// label selector matches no objects.
	// +optional
	podMonitorSelector?: null | metav1.#LabelSelector @go(PodMonitorSelector,*metav1.LabelSelector)

	// ServiceMonitors to be selected for target discovery.
	// A label selector is a label query over a set of resources. The result of matchLabels and
	// matchExpressions are ANDed. An empty label selector matches all objects. A null
	// label selector matches no objects.
	// +optional
	serviceMonitorSelector?: null | metav1.#LabelSelector @go(ServiceMonitorSelector,*metav1.LabelSelector)

	// ScrapeConfigs to be selected for target discovery.
	// A label selector is a label query over a set of resources. The result of matchLabels and
	// matchExpressions are ANDed. An empty label selector matches all objects. A null
	// label selector matches no objects.
	// +optional
	scrapeConfigSelector?: null | metav1.#LabelSelector @go(ScrapeConfigSelector,*metav1.LabelSelector)

	// Probes to be selected for target discovery.
	// A label selector is a label query over a set of resources. The result of matchLabels and
	// matchExpressions are ANDed. An empty label selector matches all objects. A null
	// label selector matches no objects.
	// +optional
	probeSelector?: null | metav1.#LabelSelector @go(ProbeSelector,*metav1.LabelSelector)
}

#TargetAllocatorAllocationStrategy: string // #enumTargetAllocatorAllocationStrategy

#enumTargetAllocatorAllocationStrategy:
	#TargetAllocatorAllocationStrategyLeastWeighted |
	#TargetAllocatorAllocationStrategyConsistentHashing |
	#TargetAllocatorAllocationStrategyPerNode

#TargetAllocatorFilterStrategy: string // #enumTargetAllocatorFilterStrategy

#enumTargetAllocatorFilterStrategy:
	#TargetAllocatorFilterStrategyRelabelConfig

// TargetAllocatorAllocationStrategyLeastWeighted targets will be distributed to collector with fewer targets currently assigned.
#TargetAllocatorAllocationStrategyLeastWeighted: #TargetAllocatorAllocationStrategy & "least-weighted"

// TargetAllocatorAllocationStrategyConsistentHashing targets will be consistently added to collectors, which allows a high-availability setup.
#TargetAllocatorAllocationStrategyConsistentHashing: #TargetAllocatorAllocationStrategy & "consistent-hashing"

// TargetAllocatorAllocationStrategyPerNode targets will be assigned to the collector on the node they reside on (use only with daemon set).
#TargetAllocatorAllocationStrategyPerNode: #TargetAllocatorAllocationStrategy & "per-node"

// TargetAllocatorFilterStrategyRelabelConfig targets will be consistently drops targets based on the relabel_config.
#TargetAllocatorFilterStrategyRelabelConfig: #TargetAllocatorFilterStrategy & "relabel-config"
