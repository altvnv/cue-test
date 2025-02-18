package gitops

kube: deployment: "host": {
	metadata: namespace: "kube-system"
	spec: {
		selector: matchLabels: {
			app: "host"
		}
		replicas: 1
		template: {
			metadata: labels: {
				app: "host"
			}
			spec: containers: [{
				name: "test"
				image: "crccheck/hello-world"
				args: []
			}]
		}
	}
}
