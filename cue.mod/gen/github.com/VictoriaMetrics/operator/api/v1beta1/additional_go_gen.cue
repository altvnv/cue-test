// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/VictoriaMetrics/operator/api/v1beta1

package v1beta1

import (
	"k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/util/intstr"
	"k8s.io/api/autoscaling/v2beta2"
)

_#vmPathPrefixFlagName: "http.pathPrefix"
_#healthPath:           "/health"
_#metricPath:           "/metrics"
_#reloadPath:           "/-/reload"
_#reloadAuthKey:        "reloadAuthKey"
_#snapshotCreate:       "/snapshot/create"
_#snapshotDelete:       "/snapshot/delete"

// FinalizerName name of our finalizer.
#FinalizerName:            "apps.victoriametrics.com/finalizer"
#SkipValidationAnnotation: "operator.victoriametrics.com/skip-validation"
#SkipValidationValue:      "true"
#AdditionalServiceLabel:   "operator.victoriametrics.com/additional-service"

// PVCExpandableLabel controls checks for storageClass
#PVCExpandableLabel: "operator.victoriametrics.com/pvc-allow-volume-expansion"

// EmbeddedObjectMetadata contains a subset of the fields included in k8s.io/apimachinery/pkg/apis/meta/v1.ObjectMeta
// Only fields which are relevant to embedded resources are included.
#EmbeddedObjectMetadata: {
	// Name must be unique within a namespace. Is required when creating resources, although
	// some resources may allow a client to request the generation of an appropriate name
	// automatically. Name is primarily intended for creation idempotence and configuration
	// definition.
	// Cannot be updated.
	// More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names#names
	// +optional
	name?: string @go(Name) @protobuf(1,bytes,opt)

	// Labels Map of string keys and values that can be used to organize and categorize
	// (scope and select) objects. May match selectors of replication controllers
	// and services.
	// More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels
	// +operator-sdk:gen-csv:customresourcedefinitions.specDescriptors=true
	// +operator-sdk:gen-csv:customresourcedefinitions.specDescriptors.displayName="PodLabels"
	// +operator-sdk:gen-csv:customresourcedefinitions.specDescriptors.x-descriptors="urn:alm:descriptor:com.tectonic.ui:label"
	// +optional
	labels?: {[string]: string} @go(Labels,map[string]string) @protobuf(11,bytes,rep)

	// Annotations is an unstructured key value map stored with a resource that may be
	// set by external tools to store and retrieve arbitrary metadata. They are not
	// queryable and should be preserved when modifying objects.
	// More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations
	// +optional
	annotations?: {[string]: string} @go(Annotations,map[string]string) @protobuf(12,bytes,rep)
}

// StorageSpec defines the configured storage for a group Prometheus servers.
// If neither `emptyDir` nor `volumeClaimTemplate` is specified, then by default an [EmptyDir](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir) will be used.
// +k8s:openapi-gen=true
#StorageSpec: {
	// Deprecated: subPath usage will be disabled by default in a future release, this option will become unnecessary.
	// DisableMountSubPath allows to remove any subPath usage in volume mounts.
	// +optional
	disableMountSubPath?: bool @go(DisableMountSubPath)

	// EmptyDirVolumeSource to be used by the Prometheus StatefulSets. If specified, used in place of any volumeClaimTemplate. More
	// info: https://kubernetes.io/docs/concepts/storage/volumes/#emptydir
	// +optional
	emptyDir?: null | v1.#EmptyDirVolumeSource @go(EmptyDir,*v1.EmptyDirVolumeSource)

	// A PVC spec to be used by the VMAlertManager StatefulSets.
	// +optional
	volumeClaimTemplate?: #EmbeddedPersistentVolumeClaim @go(VolumeClaimTemplate)
}

// EmbeddedPersistentVolumeClaim is an embedded version of k8s.io/api/core/v1.PersistentVolumeClaim.
// It contains TypeMeta and a reduced ObjectMeta.
#EmbeddedPersistentVolumeClaim: {
	metav1.#TypeMeta

	// EmbeddedMetadata contains metadata relevant to an EmbeddedResource.
	// +optional
	metadata?: #EmbeddedObjectMetadata @go(EmbeddedObjectMetadata) @protobuf(1,bytes,opt)

	// Spec defines the desired characteristics of a volume requested by a pod author.
	// More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
	// +optional
	spec?: v1.#PersistentVolumeClaimSpec @go(Spec) @protobuf(2,bytes,opt)

	// Status represents the current information/status of a persistent volume claim.
	// Read-only.
	// More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
	// +optional
	status?: v1.#PersistentVolumeClaimStatus @go(Status) @protobuf(3,bytes,opt)
}

// HTTPAuth generic auth used with http protocols
#HTTPAuth: {
	basicAuth?: null | #BasicAuth @go(BasicAuth,*BasicAuth)
	oauth2?:    null | #OAuth2    @go(OAuth2,*OAuth2)
	tlsConfig?: null | #TLSConfig @go(TLSConfig,*TLSConfig)

	#BearerAuth

	// Headers allow configuring custom http headers
	// Must be in form of semicolon separated header with value
	// e.g.
	// headerName:headerValue
	// vmalert supports it since 1.79.0 version
	// +optional
	headers?: [...string] @go(Headers,[]string)
}

// BearerAuth defines auth with bearer token
#BearerAuth: {
	// Path to bearer token file
	// +optional
	bearerTokenFile?: string @go(TokenFilePath)

	// Optional bearer auth token to use for -remoteWrite.url
	// +optional
	bearerTokenSecret?: null | v1.#SecretKeySelector @go(TokenSecret,*v1.SecretKeySelector)
}

// BasicAuth allow an endpoint to authenticate over basic authentication
// +k8s:openapi-gen=true
#BasicAuth: {
	// The secret in the service scrape namespace that contains the username
	// for authentication.
	// It must be at them same namespace as CRD
	// +optional
	username?: v1.#SecretKeySelector @go(Username)

	// The secret in the service scrape namespace that contains the password
	// for authentication.
	// It must be at them same namespace as CRD
	// +optional
	password?: v1.#SecretKeySelector @go(Password)

	// PasswordFile defines path to password file at disk
	// +optional
	password_file?: string @go(PasswordFile)
}

// ServiceSpec defines additional service for CRD with user-defined params.
// by default, some of fields can be inherited from default service definition for the CRD:
// labels,selector, ports.
// if metadata.name is not defined, service will have format {{CRD_TYPE}}-{{CRD_NAME}}-additional-service.
// +k8s:openapi-gen=true
#AdditionalServiceSpec: {
	// EmbeddedObjectMetadata defines objectMeta for additional service.
	metadata?: #EmbeddedObjectMetadata @go(EmbeddedObjectMetadata)

	// ServiceSpec describes the attributes that a user creates on a service.
	// More info: https://kubernetes.io/docs/concepts/services-networking/service/
	spec: v1.#ServiceSpec @go(Spec)
}

#EmbeddedPodDisruptionBudgetSpec: {
	// An eviction is allowed if at least "minAvailable" pods selected by
	// "selector" will still be available after the eviction, i.e. even in the
	// absence of the evicted pod.  So for example you can prevent all voluntary
	// evictions by specifying "100%".
	// +optional
	minAvailable?: null | intstr.#IntOrString @go(MinAvailable,*intstr.IntOrString)

	// An eviction is allowed if at most "maxUnavailable" pods selected by
	// "selector" are unavailable after the eviction, i.e. even in absence of
	// the evicted pod. For example, one can prevent all voluntary evictions
	// by specifying 0. This is a mutually exclusive setting with "minAvailable".
	// +optional
	maxUnavailable?: null | intstr.#IntOrString @go(MaxUnavailable,*intstr.IntOrString)

	// replaces default labels selector generated by operator
	// it's useful when you need to create custom budget
	// +optional
	selectorLabels?: {[string]: string} @go(SelectorLabels,map[string]string)
}

// EmbeddedProbes - it allows to override some probe params.
// its not necessary to specify all options,
// operator will replace missing spec with default values.
#EmbeddedProbes: {
	// LivenessProbe that will be added CRD pod
	// +optional
	livenessProbe?: null | v1.#Probe @go(LivenessProbe,*v1.Probe)

	// ReadinessProbe that will be added CRD pod
	// +optional
	readinessProbe?: null | v1.#Probe @go(ReadinessProbe,*v1.Probe)

	// StartupProbe that will be added to CRD pod
	// +optional
	startupProbe?: null | v1.#Probe @go(StartupProbe,*v1.Probe)
}

// EmbeddedHPA embeds HorizontalPodAutoScaler spec v2.
// https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/horizontal-pod-autoscaler-v2/
#EmbeddedHPA: {
	minReplicas?: null | int32 @go(MinReplicas,*int32)
	maxReplicas?: int32        @go(MaxReplicas)
	metrics?: [...v2beta2.#MetricSpec] @go(Metrics,[]v2beta2.MetricSpec)
	behaviour?: null | v2beta2.#HorizontalPodAutoscalerBehavior @go(Behaviour,*v2beta2.HorizontalPodAutoscalerBehavior)
}

// DiscoverySelector can be used at CRD components discovery
#DiscoverySelector: {
	namespaceSelector?: null | #NamespaceSelector    @go(Namespace,*NamespaceSelector)
	labelSelector?:     null | metav1.#LabelSelector @go(Labels,*metav1.LabelSelector)
}

// ConfigMapKeyReference refers to a key in a ConfigMap.
#ConfigMapKeyReference: {
	v1.#LocalObjectReference

	// The ConfigMap key to refer to.
	key: string @go(Key)
}

// StreamAggrConfig defines the stream aggregation config
// +k8s:openapi-gen=true
#StreamAggrConfig: {
	// Stream aggregation rules
	rules: [...#StreamAggrRule] @go(Rules,[]StreamAggrRule)

	// Allows writing both raw and aggregate data
	// +optional
	keepInput?: bool @go(KeepInput)

	// Allow drop all the input samples after the aggregation
	dropInput?: bool @go(DropInput)

	// Allows setting different de-duplication intervals per each configured remote storage
	// +optional
	dedupInterval?: string @go(DedupInterval)
}

// StreamAggrRule defines the rule in stream aggregation config
// +k8s:openapi-gen=true
#StreamAggrRule: {
	// Match is a label selector (or list of label selectors) for filtering time series for the given selector.
	//
	// If the match isn't set, then all the input time series are processed.
	// +optional
	// +kubebuilder:validation:Schemaless
	// +kubebuilder:pruning:PreserveUnknownFields
	match?: #StringOrArray @go(Match)

	// Interval is the interval between aggregations.
	interval: string @go(Interval)

	// StalenessInterval defines an interval after which the series state will be reset if no samples have been sent during it.
	staleness_interval?: string @go(StalenessInterval)

	// Outputs is a list of output aggregate functions to produce.
	//
	// The following names are allowed:
	//
	// - total - aggregates input counters
	// - increase - counts the increase over input counters
	// - count_series - counts the input series
	// - count_samples - counts the input samples
	// - sum_samples - sums the input samples
	// - last - the last biggest sample value
	// - min - the minimum sample value
	// - max - the maximum sample value
	// - avg - the average value across all the samples
	// - stddev - standard deviation across all the samples
	// - stdvar - standard variance across all the samples
	// - histogram_bucket - creates VictoriaMetrics histogram for input samples
	// - quantiles(phi1, ..., phiN) - quantiles' estimation for phi in the range [0..1]
	//
	// The output time series will have the following names:
	//
	//   input_name:aggr_<interval>_<output>
	//
	outputs: [...string] @go(Outputs,[]string)

	// By is an optional list of labels for grouping input series.
	//
	// See also Without.
	//
	// If neither By nor Without are set, then the Outputs are calculated
	// individually per each input time series.
	// +optional
	by?: [...string] @go(By,[]string)

	// Without is an optional list of labels, which must be excluded when grouping input series.
	//
	// See also By.
	//
	// If neither By nor Without are set, then the Outputs are calculated
	// individually per each input time series.
	// +optional
	without?: [...string] @go(Without,[]string)

	// InputRelabelConfigs is an optional relabeling rules, which are applied on the input
	// before aggregation.
	// +optional
	input_relabel_configs?: [...#RelabelConfig] @go(InputRelabelConfigs,[]RelabelConfig)

	// OutputRelabelConfigs is an optional relabeling rules, which are applied
	// on the aggregated output before being sent to remote storage.
	// +optional
	output_relabel_configs?: [...#RelabelConfig] @go(OutputRelabelConfigs,[]RelabelConfig)
}

// KeyValue defines a (key, value) tuple.
// +kubebuilder:object:generate=false
// +k8s:openapi-gen=false
#KeyValue: {
	// Key of the tuple.
	// +kubebuilder:validation:MinLength=1
	key: string @go(Key)

	// Value of the tuple.
	value: string @go(Value)
}

// StringOrArray is a helper type for storing string or array of string.
#StringOrArray: _

// License holds license key for enterprise features.
// Using license key is supported starting from VictoriaMetrics v1.94.0
// See: https://docs.victoriametrics.com/enterprise.html
#License: {
	// Enterprise license key. This flag is available only in VictoriaMetrics enterprise.
	// Documentation - https://docs.victoriametrics.com/enterprise.html
	// for more information, visit https://victoriametrics.com/products/enterprise/ .
	// To request a trial license, go to https://victoriametrics.com/products/enterprise/trial/
	key?: null | string @go(Key,*string)

	// KeyRef is reference to secret with license key for enterprise features.
	keyRef?: null | v1.#SecretKeySelector @go(KeyRef,*v1.SecretKeySelector)
}
