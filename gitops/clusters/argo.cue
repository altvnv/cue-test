package bootstrap

import (
    argo_v1alpha1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
)

_cluster: string

application: [_]: argo_v1alpha1.#Application & {
	metadata: {
		namespace: "argocd"
		labels: kind: "apps"
		finalizers?: ["resources-finalizer.argocd.argoproj.io"]
	}
	spec: {
		project: *_cluster | string
		destination: name: _cluster
	}
}

appProject: [ID=string]: argo_v1alpha1.#AppProject & {
	metadata: namespace: "argocd"
	spec: {
		description: *"\(_cluster) cluster configuration" | string
		sourceRepos: *["*"] | [string]
		destinations: [{
			namespace: "*"
			name:      *ID | string
		}]

		clusterResourceWhitelist: [{
			group: "*"
			kind:  "*"
		}]

		namespaceResourceWhitelist: [{
			group: "*"
			kind:  "*"
		}]

		orphanedResources: warn: false
	}
}
