package gitops

import (
    test_cluster "github.com/altvnv/cue-test/gitops/clusters/test-cluster/bootstrap"
)

let _clusters = [
    test_cluster
]

for _cluster in _clusters {
    argocd: appProject: _cluster.appProject
    argocd: application: _cluster.application
}
