package kubeStateMetrics

defaultConfig: {
	prometheus: monitor: {
		enabled:     *false | bool
		honorLabels: true
	}
}
