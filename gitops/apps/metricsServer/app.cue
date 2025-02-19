package metricsServer

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
		repoURL:        "https://kubernetes-sigs.github.io/metrics-server"
		targetRevision: *"3.12.1" | string
		chart:          "metrics-server"
		helm: {
			releaseName:  *"metrics-server" | string
			version:      "v3"
			valuesObject: *defaultConfig | _
		}
	}
}
