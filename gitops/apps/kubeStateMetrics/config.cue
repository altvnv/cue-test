package kubeStateMetrics

GKEConfig: defaultConfig & {
	#SAAnnotations: [string]: string
	serviceAccount: {
		create:      true
		annotations: #SAAnnotations
		name:        "kube-state-metrics"
	}
	collectors: [
		"certificatesigningrequests",
		"configmaps",
		"cronjobs",
		"daemonsets",
		"deployments",
		"endpoints",
		"horizontalpodautoscalers",
		"ingresses",
		"jobs",
		"leases",
		"limitranges",
		"mutatingwebhookconfigurations",
		"namespaces",
		"networkpolicies",
		"persistentvolumeclaims",
		"persistentvolumes",
		"poddisruptionbudgets",
		"pods",
		"replicasets",
		"replicationcontrollers",
		"resourcequotas",
		"secrets",
		"services",
		"statefulsets",
		"storageclasses",
		"validatingwebhookconfigurations",
		"volumeattachments",
	]
	rbac: extraRules: [{
		apiGroups: [""]
		resources: [
			"configmaps",
			"endpoints",
			"limitranges",
			"namespaces",
			"nodes",
			"persistentvolumeclaims",
			"persistentvolumes",
			"pods",
			"replicationcontrollers",
			"resourcequotas",
			"secrets",
			"services",
		]
		verbs: ["watch", "list"]
	}, {
		apiGroups: ["app"]
		resources: [
			"daemonsets",
			"deployments",
			"replicasets",
			"statefulsets",
		]
		verbs: ["watch", "list"]
	}, {
		apiGroups: ["batch"]
		resources: ["cronjobs", "jobs"]
		verbs: ["watch", "list"]
	}, {
		apiGroups: ["autoscaling"]
		resources: ["horizontalpodautoscalers"]
		verbs: ["watch", "list"]
	}, {
		apiGroups: ["certificates.k8s.io"]
		resources: ["certificatesigningrequests"]
		verbs: ["watch", "list"]
	}, {
		apiGroups: ["networking.k8s.io"]
		resources: ["networkpolicies", "ingressclasses", "ingresses"]
		verbs: ["watch", "list"]
	}, {
		apiGroups: ["storage.k8s.io"]
		resources: ["storageclasses", "volumeattachments"]
		verbs: ["watch", "list"]
	}, {
		apiGroups: ["admissionregistration.k8s.io"]
		resources: [
			"mutatingwebhookconfigurations",
			"validatingwebhookconfigurations",
		]
		verbs: ["watch", "list"]
	}]
}

defaultConfig: {
	prometheus: monitor: {
		enabled:     *true | bool
		honorLabels: true
	}
}
