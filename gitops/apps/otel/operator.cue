package otel

import (
	argo_v1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
	"github.com/altvnv/cue-test/gitops/apps"
)

#Operator: argo_v1.#Application
#Operator: spec: {
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
		targetRevision: *"0.75.0" | string
		chart:          "opentelemetry-operator"
		helm: {
			releaseName:  "opentelemetry-operator"
			version:      "v3"
			valuesObject: *defaultConfig | _
		}
	}
}
