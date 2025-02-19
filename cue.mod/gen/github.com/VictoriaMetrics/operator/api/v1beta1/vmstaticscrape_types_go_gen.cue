// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/VictoriaMetrics/operator/api/v1beta1

package v1beta1

import (
	"k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// VMStaticScrapeSpec defines the desired state of VMStaticScrape.
#VMStaticScrapeSpec: {
	// JobName name of job.
	jobName?: string @go(JobName)

	// A list of target endpoints to scrape metrics from.
	targetEndpoints: [...null | #TargetEndpoint] @go(TargetEndpoints,[]*TargetEndpoint)

	// SampleLimit defines per-scrape limit on number of scraped samples that will be accepted.
	// +optional
	sampleLimit?: uint64 @go(SampleLimit)
}

// TargetEndpoint defines single static target endpoint.
#TargetEndpoint: {
	// Targets static targets addresses in form of ["192.122.55.55:9100","some-name:9100"].
	// +kubebuilder:validation:MinItems=1
	targets: [...string] @go(Targets,[]string)

	// Labels static labels for targets.
	// +optional
	labels?: {[string]: string} @go(Labels,map[string]string)

	// Default port for target.
	// +optional
	port?: string @go(Port)

	// HTTP path to scrape for metrics.
	// +optional
	path?: string @go(Path)

	// HTTP scheme to use for scraping.
	// +optional
	// +kubebuilder:validation:Enum=http;https
	scheme?: string @go(Scheme)

	// Optional HTTP URL parameters
	// +optional
	params?: {[string]: [...string]} @go(Params,map[string][]string)

	// FollowRedirects controls redirects for scraping.
	// +optional
	follow_redirects?: null | bool @go(FollowRedirects,*bool)

	// SampleLimit defines per-scrape limit on number of scraped samples that will be accepted.
	// +optional
	sampleLimit?: uint64 @go(SampleLimit)

	// Interval at which metrics should be scraped
	// +optional
	interval?: string @go(Interval)

	// ScrapeInterval is the same as Interval and has priority over it.
	// one of scrape_interval or interval can be used
	// +optional
	scrape_interval?: string @go(ScrapeInterval)

	// Timeout after which the scrape is ended
	// +optional
	scrapeTimeout?: string @go(ScrapeTimeout)

	// OAuth2 defines auth configuration
	// +optional
	oauth2?: null | #OAuth2 @go(OAuth2,*OAuth2)

	// TLSConfig configuration to use when scraping the endpoint
	// +optional
	tlsConfig?: null | #TLSConfig @go(TLSConfig,*TLSConfig)

	// File to read bearer token for scraping targets.
	// +optional
	bearerTokenFile?: string @go(BearerTokenFile)

	// Secret to mount to read bearer token for scraping targets. The secret
	// needs to be in the same namespace as the service scrape and accessible by
	// the victoria-metrics operator.
	// +optional
	// +nullable
	bearerTokenSecret?: null | v1.#SecretKeySelector @go(BearerTokenSecret,*v1.SecretKeySelector)

	// BasicAuth allow an endpoint to authenticate over basic authentication
	// More info: https://prometheus.io/docs/operating/configuration/#endpoints
	// +optional
	basicAuth?: null | #BasicAuth @go(BasicAuth,*BasicAuth)

	// Authorization with http header Authorization
	// +optional
	authorization?: null | #Authorization @go(Authorization,*Authorization)

	// MetricRelabelConfigs to apply to samples before ingestion.
	// +optional
	metricRelabelConfigs?: [...null | #RelabelConfig] @go(MetricRelabelConfigs,[]*RelabelConfig)

	// RelabelConfigs to apply to samples before scraping.
	// More info: https://prometheus.io/docs/prometheus/latest/configuration/configuration/#relabel_config
	// +optional
	relabelConfigs?: [...null | #RelabelConfig] @go(RelabelConfigs,[]*RelabelConfig)

	// ProxyURL eg http://proxyserver:2195 Directs scrapes to proxy through this endpoint.
	// +optional
	proxyURL?: null | string @go(ProxyURL,*string)

	// HonorLabels chooses the metric's labels on collisions with target labels.
	// +optional
	honorLabels?: bool @go(HonorLabels)

	// HonorTimestamps controls whether vmagent respects the timestamps present in scraped data.
	// +optional
	honorTimestamps?: null | bool @go(HonorTimestamps,*bool)

	// VMScrapeParams defines VictoriaMetrics specific scrape parametrs
	// +optional
	vm_scrape_params?: null | #VMScrapeParams @go(VMScrapeParams,*VMScrapeParams)
}

// VMStaticScrapeStatus defines the observed state of VMStaticScrape
#VMStaticScrapeStatus: {
}

// VMStaticScrape  defines static targets configuration for scraping.
// +kubebuilder:object:root=true
// +kubebuilder:subresource:status
// +genclient
#VMStaticScrape: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta    @go(ObjectMeta)
	spec?:     #VMStaticScrapeSpec   @go(Spec)
	status?:   #VMStaticScrapeStatus @go(Status)
}

// VMStaticScrapeList contains a list of VMStaticScrape
#VMStaticScrapeList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#VMStaticScrape] @go(Items,[]VMStaticScrape)
}
