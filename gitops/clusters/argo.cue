package bootstrap

import (
	"strings"
    argo_v1alpha1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
)

_cluster: string

argocd: [TYPE=_]: [ID=_]: {
	apiVersion: "argoproj.io/v1alpha1"
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

argocd: close({
	application: [string]: argo_v1alpha1.#Application
	appProject: [string]:  argo_v1alpha1.#AppProject
})

application: [_]: {
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

appProject: [ID=string]: {
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
