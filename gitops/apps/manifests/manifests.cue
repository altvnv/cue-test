package manifests

import (
	argo_v1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
	"github.com/altvnv/cue-test/gitops/apps"
)

#Manifests: argo_v1.#Application
#Manifests: spec: {
	#SyncPolicyEnable: *true | bool
	if #SyncPolicyEnable {
		syncPolicy: apps.#SyncPolicy.autoPrune
	}
	destination: name: string
	source: {
		repoURL:        "https://github.com/altvnv/cue-test"
		targetRevision: *"HEAD" | string
		path!:          string
		plugin: name: "cue"
	}
}
