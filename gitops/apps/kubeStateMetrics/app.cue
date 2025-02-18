package kubeStateMetrics

import "github.com/p2p-org/etherno-iac/gitops/apps"

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
