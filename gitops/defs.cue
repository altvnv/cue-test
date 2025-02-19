package gitops

import (
	"strings"

	// Kubernetes
	core_v1 "k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
	rbac_v1 "k8s.io/api/rbac/v1"
	networking_v1 "k8s.io/api/networking/v1"
)

kube: [TYPE=_]: [ID=_]: {
	apiVersion: *"v1" | string
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

kube: close({
	namespace: [string]:      core_v1.#Namespace
	serviceAccount: [string]: core_v1.#ServiceAccount
	secret: [string]:         core_v1.#Secret
	service: [string]:        core_v1.#Service
	ingress: [string]: networking_v1.#Ingress & {
		apiVersion: "networking.k8s.io/v1"
	}
	deployment: [string]: apps_v1.#Deployment & {
		apiVersion: "apps/v1"
	}
	statefulSet: [string]: apps_v1.#StatefulSet & {
		apiVersion: "apps/v1"
	}
	clusterRole: [string]: rbac_v1.#ClusterRole & {
		apiVersion: "rbac.authorization.k8s.io/v1"
	}
	roleBinding: [string]: rbac_v1.#RoleBinding & {
		apiVersion: "rbac.authorization.k8s.io/v1"
	}
	clusterRoleBinding: [string]: rbac_v1.#ClusterRoleBinding & {
		apiVersion: "rbac.authorization.k8s.io/v1"
	}
})
