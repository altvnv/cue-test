package otel

import (
	argo_v1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
	"github.com/altvnv/cue-test/gitops/apps"
)

#Collector: argo_v1.#Application
#Collector: spec: {
	#SyncPolicyEnable: *true | bool
	if #SyncPolicyEnable {
		syncPolicy: apps.#SyncPolicy.autoPrune
	}
	destination: {
		name:      string
		namespace: *"monitoring-system" | string
	}
	source: {
		repoURL:        "https://open-telemetry.github.io/opentelemetry-helm-charts"
		targetRevision: *"0.110.5" | string
		chart:          "opentelemetry-collector"
		helm: {
			releaseName:  "opentelemetry-collector"
			version:      "v3"
			valuesObject: *defaultCollectorConfig | _
		}
	}
}
