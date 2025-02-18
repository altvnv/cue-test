package kubeStateMetrics

import (
	argo_v1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
	"github.com/altvnv/cue-test/gitops/apps"
)

#App: argo_v1.#Application
#App: spec: {
	#SyncPolicyEnable: *true | bool
	if #SyncPolicyEnable {
		syncPolicy: apps.#SyncPolicy.autoPrune
	}
	destination: {
		name:      string
		namespace: *"kube-system" | string
	}
	source: {
		repoURL:        "https://prometheus-community.github.io/helm-charts"
		targetRevision: *"5.25.1" | string
		chart:          "kube-state-metrics"
		helm: {
			releaseName:  "kube-state-metrics"
			version:      "v3"
			valuesObject: *defaultConfig | _
		}
	}
}

defaultConfig: {
	prometheus: monitor: {
		enabled:     *true | bool
		honorLabels: true
	}
}
