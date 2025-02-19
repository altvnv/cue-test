package gitops

kube: deployment: "host": {
	metadata: namespace: "kube-system"
	spec: {
		replicas: 1
		template: spec: containers: [{
			name: "test"
			image: "gcr.io/myproj/host:v0.1.10"
			args: []
		}]
	}
}
