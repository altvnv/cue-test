package bootstrap

import (
	"github.com/altvnv/cue-test/gitops/apps/kubeStateMetrics"
	"github.com/altvnv/cue-test/gitops/apps/metricsServer"
	"github.com/altvnv/cue-test/gitops/apps/manifests"
)

appProject: "\(_cluster)": {}
application: {
	"\(_cluster)-manifests": manifests.#Manifests
	"\(_cluster)-manifests": spec: source: path: "gitops/clusters/\(_cluster)"

	"\(_cluster)-metrics-server": metricsServer.#App
	"\(_cluster)-kube-state-metrics": kubeStateMetrics.#App
}
