package gitops

import (
	"github.com/altvnv/cue-test/gitops/apps/kubeStateMetrics"
	"github.com/altvnv/cue-test/gitops/apps/metricsServer"
	// "github.com/altvnv/cue-test/gitops/apps/manifests"
)

argocd: appProject: "\(_cluster)": {}
argocd: application: {
	"\(_cluster)_metrics-server": metricsServer.#App
	"\(_cluster)_kube-state-metrics": kubeStateMetrics.#App
}
