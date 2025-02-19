package kubeStateMetrics

defaultConfig: {
	prometheus: monitor: {
		enabled:     *true | bool
		honorLabels: true
	}
}
