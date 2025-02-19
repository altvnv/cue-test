package gitops

import (
	"github.com/altvnv/cue-test/gitops/apps/kubeStateMetrics"
	"github.com/altvnv/cue-test/gitops/apps/metricsServer"
	// "github.com/altvnv/cue-test/gitops/apps/manifests"
)

argocd: appProject: "\(_cluster)": {}
argocd: application: {
	"\(_cluster)/metrics-server": metricsServer.#App
	"\(_cluster)/kube-state-metrics": kubeStateMetrics.#App
}
