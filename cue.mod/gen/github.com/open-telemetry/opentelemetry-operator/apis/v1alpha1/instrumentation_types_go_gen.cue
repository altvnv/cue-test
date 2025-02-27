// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/open-telemetry/opentelemetry-operator/apis/v1alpha1

package v1alpha1

import (
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/api/resource"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// InstrumentationSpec defines the desired state of OpenTelemetry SDK and instrumentation.
#InstrumentationSpec: {
	// Exporter defines exporter configuration.
	// +optional
	exporter?: #Exporter @go(Exporter)

	// Resource defines the configuration for the resource attributes, as defined by the OpenTelemetry specification.
	// +optional
	resource?: #Resource @go(Resource)

	// Propagators defines inter-process context propagation configuration.
	// Values in this list will be set in the OTEL_PROPAGATORS env var.
	// Enum=tracecontext;baggage;b3;b3multi;jaeger;xray;ottrace;none
	// +optional
	propagators?: [...#Propagator] @go(Propagators,[]Propagator)

	// Sampler defines sampling configuration.
	// +optional
	sampler?: #Sampler @go(Sampler)

	// Defaults defines default values for the instrumentation.
	defaults?: #Defaults @go(Defaults)

	// Env defines common env vars. There are four layers for env vars' definitions and
	// the precedence order is: `original container env vars` > `language specific env vars` > `common env vars` > `instrument spec configs' vars`.
	// If the former var had been defined, then the other vars would be ignored.
	// +optional
	env?: [...corev1.#EnvVar] @go(Env,[]corev1.EnvVar)

	// Java defines configuration for java auto-instrumentation.
	// +optional
	java?: #Java @go(Java)

	// NodeJS defines configuration for nodejs auto-instrumentation.
	// +optional
	nodejs?: #NodeJS @go(NodeJS)

	// Python defines configuration for python auto-instrumentation.
	// +optional
	python?: #Python @go(Python)

	// DotNet defines configuration for DotNet auto-instrumentation.
	// +optional
	dotnet?: #DotNet @go(DotNet)

	// Go defines configuration for Go auto-instrumentation.
	// When using Go auto-instrumentation you must provide a value for the OTEL_GO_AUTO_TARGET_EXE env var via the
	// Instrumentation env vars or via the instrumentation.opentelemetry.io/otel-go-auto-target-exe pod annotation.
	// Failure to set this value causes instrumentation injection to abort, leaving the original pod unchanged.
	// +optional
	go?: #Go @go(Go)

	// ApacheHttpd defines configuration for Apache HTTPD auto-instrumentation.
	// +optional
	apacheHttpd?: #ApacheHttpd @go(ApacheHttpd)

	// Nginx defines configuration for Nginx auto-instrumentation.
	// +optional
	nginx?: #Nginx @go(Nginx)
}

// Resource defines the configuration for the resource attributes, as defined by the OpenTelemetry specification.
// See also: https://github.com/open-telemetry/opentelemetry-specification/blob/v1.8.0/specification/overview.md#resources
#Resource: {
	// Attributes defines attributes that are added to the resource.
	// For example environment: dev
	// +optional
	resourceAttributes?: {[string]: string} @go(Attributes,map[string]string)

	// AddK8sUIDAttributes defines whether K8s UID attributes should be collected (e.g. k8s.deployment.uid).
	// +optional
	addK8sUIDAttributes?: bool @go(AddK8sUIDAttributes)
}

// Exporter defines OTLP exporter configuration.
#Exporter: {
	// Endpoint is address of the collector with OTLP endpoint.
	// If the endpoint defines https:// scheme TLS has to be specified.
	// +optional
	endpoint?: string @go(Endpoint)

	// TLS defines certificates for TLS.
	// TLS needs to be enabled by specifying https:// scheme in the Endpoint.
	tls?: null | #TLS @go(TLS,*TLS)
}

// TLS defines TLS configuration for exporter.
#TLS: {
	// SecretName defines secret name that will be used to configure TLS on the exporter.
	// It is user responsibility to create the secret in the namespace of the workload.
	// The secret must contain client certificate (Cert) and private key (Key).
	// The CA certificate might be defined in the secret or in the config map.
	secretName?: string @go(SecretName)

	// ConfigMapName defines configmap name with CA certificate. If it is not defined CA certificate will be
	// used from the secret defined in SecretName.
	configMapName?: string @go(ConfigMapName)

	// CA defines the key of certificate (e.g. ca.crt) in the configmap map, secret or absolute path to a certificate.
	// The absolute path can be used when certificate is already present on the workload filesystem e.g.
	// /var/run/secrets/kubernetes.io/serviceaccount/service-ca.crt
	ca_file?: string @go(CA)

	// Cert defines the key (e.g. tls.crt) of the client certificate in the secret or absolute path to a certificate.
	// The absolute path can be used when certificate is already present on the workload filesystem.
	cert_file?: string @go(Cert)

	// Key defines a key (e.g. tls.key) of the private key in the secret or absolute path to a certificate.
	// The absolute path can be used when certificate is already present on the workload filesystem.
	key_file?: string @go(Key)
}

// Sampler defines sampling configuration.
#Sampler: {
	// Type defines sampler type.
	// The value will be set in the OTEL_TRACES_SAMPLER env var.
	// The value can be for instance parentbased_always_on, parentbased_always_off, parentbased_traceidratio...
	// +optional
	type?: #SamplerType @go(Type)

	// Argument defines sampler argument.
	// The value depends on the sampler type.
	// For instance for parentbased_traceidratio sampler type it is a number in range [0..1] e.g. 0.25.
	// The value will be set in the OTEL_TRACES_SAMPLER_ARG env var.
	// +optional
	argument?: string @go(Argument)
}

// Defaults defines default values for the instrumentation.
#Defaults: {
	// UseLabelsForResourceAttributes defines whether to use common labels for resource attributes:
	//   - `app.kubernetes.io/name` becomes `service.name`
	//   - `app.kubernetes.io/version` becomes `service.version`
	//   - `app.kubernetes.io/part-of` becomes `service.namespace`
	useLabelsForResourceAttributes?: bool @go(UseLabelsForResourceAttributes)
}

// Java defines Java SDK and instrumentation configuration.
#Java: {
	// Image is a container image with javaagent auto-instrumentation JAR.
	// +optional
	image?: string @go(Image)

	// VolumeClaimTemplate defines a ephemeral volume used for auto-instrumentation.
	// If omitted, an emptyDir is used with size limit VolumeSizeLimit
	volumeClaimTemplate?: corev1.#PersistentVolumeClaimTemplate @go(VolumeClaimTemplate)

	// VolumeSizeLimit defines size limit for volume used for auto-instrumentation.
	// The default size is 200Mi.
	volumeLimitSize?: null | resource.#Quantity @go(VolumeSizeLimit,*resource.Quantity)

	// Env defines java specific env vars. There are four layers for env vars' definitions and
	// the precedence order is: `original container env vars` > `language specific env vars` > `common env vars` > `instrument spec configs' vars`.
	// If the former var had been defined, then the other vars would be ignored.
	// +optional
	env?: [...corev1.#EnvVar] @go(Env,[]corev1.EnvVar)

	// Resources describes the compute resource requirements.
	// +optional
	resources?: corev1.#ResourceRequirements @go(Resources)

	// Extensions defines java specific extensions.
	// All extensions are copied to a single directory; if a JAR with the same name exists, it will be overwritten.
	// +optional
	extensions?: [...#Extensions] @go(Extensions,[]Extensions)
}

#Extensions: {
	// Image is a container image with extensions auto-instrumentation JAR.
	image: string @go(Image)

	// Dir is a directory with extensions auto-instrumentation JAR.
	dir: string @go(Dir)
}

// NodeJS defines NodeJS SDK and instrumentation configuration.
#NodeJS: {
	// Image is a container image with NodeJS SDK and auto-instrumentation.
	// +optional
	image?: string @go(Image)

	// VolumeClaimTemplate defines a ephemeral volume used for auto-instrumentation.
	// If omitted, an emptyDir is used with size limit VolumeSizeLimit
	volumeClaimTemplate?: corev1.#PersistentVolumeClaimTemplate @go(VolumeClaimTemplate)

	// VolumeSizeLimit defines size limit for volume used for auto-instrumentation.
	// The default size is 200Mi.
	volumeLimitSize?: null | resource.#Quantity @go(VolumeSizeLimit,*resource.Quantity)

	// Env defines nodejs specific env vars. There are four layers for env vars' definitions and
	// the precedence order is: `original container env vars` > `language specific env vars` > `common env vars` > `instrument spec configs' vars`.
	// If the former var had been defined, then the other vars would be ignored.
	// +optional
	env?: [...corev1.#EnvVar] @go(Env,[]corev1.EnvVar)

	// Resources describes the compute resource requirements.
	// +optional
	resourceRequirements?: corev1.#ResourceRequirements @go(Resources)
}

// Python defines Python SDK and instrumentation configuration.
#Python: {
	// Image is a container image with Python SDK and auto-instrumentation.
	// +optional
	image?: string @go(Image)

	// VolumeClaimTemplate defines a ephemeral volume used for auto-instrumentation.
	// If omitted, an emptyDir is used with size limit VolumeSizeLimit
	volumeClaimTemplate?: corev1.#PersistentVolumeClaimTemplate @go(VolumeClaimTemplate)

	// VolumeSizeLimit defines size limit for volume used for auto-instrumentation.
	// The default size is 200Mi.
	volumeLimitSize?: null | resource.#Quantity @go(VolumeSizeLimit,*resource.Quantity)

	// Env defines python specific env vars. There are four layers for env vars' definitions and
	// the precedence order is: `original container env vars` > `language specific env vars` > `common env vars` > `instrument spec configs' vars`.
	// If the former var had been defined, then the other vars would be ignored.
	// +optional
	env?: [...corev1.#EnvVar] @go(Env,[]corev1.EnvVar)

	// Resources describes the compute resource requirements.
	// +optional
	resourceRequirements?: corev1.#ResourceRequirements @go(Resources)
}

// DotNet defines DotNet SDK and instrumentation configuration.
#DotNet: {
	// Image is a container image with DotNet SDK and auto-instrumentation.
	// +optional
	image?: string @go(Image)

	// VolumeClaimTemplate defines a ephemeral volume used for auto-instrumentation.
	// If omitted, an emptyDir is used with size limit VolumeSizeLimit
	volumeClaimTemplate?: corev1.#PersistentVolumeClaimTemplate @go(VolumeClaimTemplate)

	// VolumeSizeLimit defines size limit for volume used for auto-instrumentation.
	// The default size is 200Mi.
	volumeLimitSize?: null | resource.#Quantity @go(VolumeSizeLimit,*resource.Quantity)

	// Env defines DotNet specific env vars. There are four layers for env vars' definitions and
	// the precedence order is: `original container env vars` > `language specific env vars` > `common env vars` > `instrument spec configs' vars`.
	// If the former var had been defined, then the other vars would be ignored.
	// +optional
	env?: [...corev1.#EnvVar] @go(Env,[]corev1.EnvVar)

	// Resources describes the compute resource requirements.
	// +optional
	resourceRequirements?: corev1.#ResourceRequirements @go(Resources)
}

#Go: {
	// Image is a container image with Go SDK and auto-instrumentation.
	// +optional
	image?: string @go(Image)

	// VolumeClaimTemplate defines a ephemeral volume used for auto-instrumentation.
	// If omitted, an emptyDir is used with size limit VolumeSizeLimit
	volumeClaimTemplate?: corev1.#PersistentVolumeClaimTemplate @go(VolumeClaimTemplate)

	// VolumeSizeLimit defines size limit for volume used for auto-instrumentation.
	// The default size is 200Mi.
	volumeLimitSize?: null | resource.#Quantity @go(VolumeSizeLimit,*resource.Quantity)

	// Env defines Go specific env vars. There are four layers for env vars' definitions and
	// the precedence order is: `original container env vars` > `language specific env vars` > `common env vars` > `instrument spec configs' vars`.
	// If the former var had been defined, then the other vars would be ignored.
	// +optional
	env?: [...corev1.#EnvVar] @go(Env,[]corev1.EnvVar)

	// Resources describes the compute resource requirements.
	// +optional
	resourceRequirements?: corev1.#ResourceRequirements @go(Resources)
}

// ApacheHttpd defines Apache SDK and instrumentation configuration.
#ApacheHttpd: {
	// Image is a container image with Apache SDK and auto-instrumentation.
	// +optional
	image?: string @go(Image)

	// VolumeClaimTemplate defines a ephemeral volume used for auto-instrumentation.
	// If omitted, an emptyDir is used with size limit VolumeSizeLimit
	volumeClaimTemplate?: corev1.#PersistentVolumeClaimTemplate @go(VolumeClaimTemplate)

	// VolumeSizeLimit defines size limit for volume used for auto-instrumentation.
	// The default size is 200Mi.
	volumeLimitSize?: null | resource.#Quantity @go(VolumeSizeLimit,*resource.Quantity)

	// Env defines Apache HTTPD specific env vars. There are four layers for env vars' definitions and
	// the precedence order is: `original container env vars` > `language specific env vars` > `common env vars` > `instrument spec configs' vars`.
	// If the former var had been defined, then the other vars would be ignored.
	// +optional
	env?: [...corev1.#EnvVar] @go(Env,[]corev1.EnvVar)

	// Attrs defines Apache HTTPD agent specific attributes. The precedence is:
	// `agent default attributes` > `instrument spec attributes` .
	// Attributes are documented at https://github.com/open-telemetry/opentelemetry-cpp-contrib/tree/main/instrumentation/otel-webserver-module
	// +optional
	attrs?: [...corev1.#EnvVar] @go(Attrs,[]corev1.EnvVar)

	// Apache HTTPD server version. One of 2.4 or 2.2. Default is 2.4
	// +optional
	version?: string @go(Version)

	// Location of Apache HTTPD server configuration.
	// Needed only if different from default "/usr/local/apache2/conf"
	// +optional
	configPath?: string @go(ConfigPath)

	// Resources describes the compute resource requirements.
	// +optional
	resourceRequirements?: corev1.#ResourceRequirements @go(Resources)
}

// Nginx defines Nginx SDK and instrumentation configuration.
#Nginx: {
	// Image is a container image with Nginx SDK and auto-instrumentation.
	// +optional
	image?: string @go(Image)

	// VolumeClaimTemplate defines a ephemeral volume used for auto-instrumentation.
	// If omitted, an emptyDir is used with size limit VolumeSizeLimit
	volumeClaimTemplate?: corev1.#PersistentVolumeClaimTemplate @go(VolumeClaimTemplate)

	// VolumeSizeLimit defines size limit for volume used for auto-instrumentation.
	// The default size is 200Mi.
	volumeLimitSize?: null | resource.#Quantity @go(VolumeSizeLimit,*resource.Quantity)

	// Env defines Nginx specific env vars. There are four layers for env vars' definitions and
	// the precedence order is: `original container env vars` > `language specific env vars` > `common env vars` > `instrument spec configs' vars`.
	// If the former var had been defined, then the other vars would be ignored.
	// +optional
	env?: [...corev1.#EnvVar] @go(Env,[]corev1.EnvVar)

	// Attrs defines Nginx agent specific attributes. The precedence order is:
	// `agent default attributes` > `instrument spec attributes` .
	// Attributes are documented at https://github.com/open-telemetry/opentelemetry-cpp-contrib/tree/main/instrumentation/otel-webserver-module
	// +optional
	attrs?: [...corev1.#EnvVar] @go(Attrs,[]corev1.EnvVar)

	// Location of Nginx configuration file.
	// Needed only if different from default "/etx/nginx/nginx.conf"
	// +optional
	configFile?: string @go(ConfigFile)

	// Resources describes the compute resource requirements.
	// +optional
	resourceRequirements?: corev1.#ResourceRequirements @go(Resources)
}

// InstrumentationStatus defines status of the instrumentation.
#InstrumentationStatus: {}

// Instrumentation is the spec for OpenTelemetry instrumentation.
#Instrumentation: {
	status?: #InstrumentationStatus @go(Status)

	metav1.#TypeMeta
	spec?:     #InstrumentationSpec @go(Spec)
	metadata?: metav1.#ObjectMeta   @go(ObjectMeta)
}

// InstrumentationList contains a list of Instrumentation.
#InstrumentationList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Instrumentation] @go(Items,[]Instrumentation)
}
