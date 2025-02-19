package otel

defaultConfig: {
	manager: {
		collectorImage: repository: "otel/opentelemetry-collector-k8s"
		serviceMonitor: enabled:    true
	}
	admissionWebhooks: certManager: enabled: false
}

defaultCollectorConfig: {
	mode: "daemonset"
	image: repository: "otel/opentelemetry-collector-k8s"
	presets: {
		logsCollection: {
			enabled:              true
			storeCheckpoints:     true
			includeCollectorLogs: true
		}
		hostMetrics: enabled: true
		kubernetesAttributes: {
			enabled:             true
			extractAllPodLabels: true
		}
	}
	extraEnvs: [{
		name: "ACCESS_TOKEN_INFRA"
		valueFrom: secretKeyRef: {
			name: "vm-infra-dev-p2p-org"
			key:  "token"
		}
	}]
}
