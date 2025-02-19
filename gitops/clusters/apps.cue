package gitops

_cluster: string

argocd: application: [_]: {
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
