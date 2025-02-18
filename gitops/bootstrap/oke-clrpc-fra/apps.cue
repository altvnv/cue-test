package gitops

import (
	"github.com/altvnv/cue-test/gitops/apps/kubeStateMetrics"
	"github.com/altvnv/cue-test/gitops/apps/manifests"
)

argocd: application: {
	"\(_cluster)-manifests": manifests.#Manifests
	"\(_cluster)-manifests": spec: source: path: "gitops/clusters/\(_cluster)"

	"\(_cluster)-kube-state-metrics": kubeStateMetrics.#App
}
