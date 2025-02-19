// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/open-telemetry/opentelemetry-operator/apis/v1beta1

package v1beta1

#Mode: string // #enumMode

#enumMode:
	#ModeDaemonSet |
	#ModeDeployment |
	#ModeSidecar |
	#ModeStatefulSet

// ModeDaemonSet specifies that the collector should be deployed as a Kubernetes DaemonSet.
#ModeDaemonSet: #Mode & "daemonset"

// ModeDeployment specifies that the collector should be deployed as a Kubernetes Deployment.
#ModeDeployment: #Mode & "deployment"

// ModeSidecar specifies that the collector should be deployed as a sidecar to pods.
#ModeSidecar: #Mode & "sidecar"

// ModeStatefulSet specifies that the collector should be deployed as a Kubernetes StatefulSet.
#ModeStatefulSet: #Mode & "statefulset"
