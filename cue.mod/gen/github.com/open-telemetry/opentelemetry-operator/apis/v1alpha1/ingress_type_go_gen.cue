// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/open-telemetry/opentelemetry-operator/apis/v1alpha1

package v1alpha1

#IngressType: string // #enumIngressType

#enumIngressType:
	#IngressTypeNginx |
	#IngressTypeRoute

// IngressTypeNginx specifies that an ingress entry should be created.
#IngressTypeNginx: #IngressType & "ingress"

// IngressTypeOpenshiftRoute specifies that an route entry should be created.
#IngressTypeRoute: #IngressType & "route"

#TLSRouteTerminationType: string // #enumTLSRouteTerminationType

#enumTLSRouteTerminationType:
	#TLSRouteTerminationTypeInsecure |
	#TLSRouteTerminationTypeEdge |
	#TLSRouteTerminationTypePassthrough |
	#TLSRouteTerminationTypeReencrypt

// TLSRouteTerminationTypeInsecure indicates that insecure connections are allowed.
#TLSRouteTerminationTypeInsecure: #TLSRouteTerminationType & "insecure"

// TLSRouteTerminationTypeEdge indicates that encryption should be terminated
// at the edge router.
#TLSRouteTerminationTypeEdge: #TLSRouteTerminationType & "edge"

// TLSTerminationPassthrough indicates that the destination service is
// responsible for decrypting traffic.
#TLSRouteTerminationTypePassthrough: #TLSRouteTerminationType & "passthrough"

// TLSTerminationReencrypt indicates that traffic will be decrypted on the edge
// and re-encrypt using a new certificate.
#TLSRouteTerminationTypeReencrypt: #TLSRouteTerminationType & "reencrypt"

// IngressRuleType defines how the collector receivers will be exposed in the Ingress.
//
// +kubebuilder:validation:Enum=path;subdomain
#IngressRuleType: string // #enumIngressRuleType

#enumIngressRuleType:
	#IngressRuleTypePath |
	#IngressRuleTypeSubdomain

// IngressRuleTypePath configures Ingress to use single host with multiple paths.
// This configuration might require additional ingress setting to rewrite paths.
#IngressRuleTypePath: #IngressRuleType & "path"

// IngressRuleTypeSubdomain configures Ingress to use multiple hosts - one for each exposed
// receiver port. The port name is used as a subdomain for the host defined in the Ingress e.g. otlp-http.example.com.
#IngressRuleTypeSubdomain: #IngressRuleType & "subdomain"
