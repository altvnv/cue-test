// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/envoyproxy/gateway/api/v1alpha1

package v1alpha1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	gwapiv1a2 "sigs.k8s.io/gateway-api/apis/v1alpha2"
	gwapiv1 "sigs.k8s.io/gateway-api/apis/v1"
)

// KindClientTrafficPolicy is the name of the ClientTrafficPolicy kind.
#KindClientTrafficPolicy: "ClientTrafficPolicy"

// ClientTrafficPolicy allows the user to configure the behavior of the connection
// between the downstream client and Envoy Proxy listener.
#ClientTrafficPolicy: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// Spec defines the desired state of ClientTrafficPolicy.
	spec: #ClientTrafficPolicySpec @go(Spec)

	// Status defines the current status of ClientTrafficPolicy.
	status?: gwapiv1a2.#PolicyStatus @go(Status)
}

// +kubebuilder:validation:XValidation:rule="(has(self.targetRef) && !has(self.targetRefs)) || (!has(self.targetRef) && has(self.targetRefs)) || (has(self.targetSelectors) && self.targetSelectors.size() > 0) ", message="either targetRef or targetRefs must be used"
//
// +kubebuilder:validation:XValidation:rule="has(self.targetRef) ? self.targetRef.group == 'gateway.networking.k8s.io' : true", message="this policy can only have a targetRef.group of gateway.networking.k8s.io"
// +kubebuilder:validation:XValidation:rule="has(self.targetRef) ? self.targetRef.kind == 'Gateway' : true", message="this policy can only have a targetRef.kind of Gateway"
// +kubebuilder:validation:XValidation:rule="has(self.targetRefs) ? self.targetRefs.all(ref, ref.group == 'gateway.networking.k8s.io') : true", message="this policy can only have a targetRefs[*].group of gateway.networking.k8s.io"
// +kubebuilder:validation:XValidation:rule="has(self.targetRefs) ? self.targetRefs.all(ref, ref.kind == 'Gateway') : true", message="this policy can only have a targetRefs[*].kind of Gateway"
//
// ClientTrafficPolicySpec defines the desired state of ClientTrafficPolicy.
#ClientTrafficPolicySpec: {
	#PolicyTargetReferences

	// TcpKeepalive settings associated with the downstream client connection.
	// If defined, sets SO_KEEPALIVE on the listener socket to enable TCP Keepalives.
	// Disabled by default.
	//
	// +optional
	tcpKeepalive?: null | #TCPKeepalive @go(TCPKeepalive,*TCPKeepalive)

	// EnableProxyProtocol interprets the ProxyProtocol header and adds the
	// Client Address into the X-Forwarded-For header.
	// Note Proxy Protocol must be present when this field is set, else the connection
	// is closed.
	//
	// +optional
	enableProxyProtocol?: null | bool @go(EnableProxyProtocol,*bool)

	// ClientIPDetectionSettings provides configuration for determining the original client IP address for requests.
	//
	// +optional
	clientIPDetection?: null | #ClientIPDetectionSettings @go(ClientIPDetection,*ClientIPDetectionSettings)

	// TLS settings configure TLS termination settings with the downstream client.
	//
	// +optional
	tls?: null | #ClientTLSSettings @go(TLS,*ClientTLSSettings)

	// Path enables managing how the incoming path set by clients can be normalized.
	//
	// +optional
	path?: null | #PathSettings @go(Path,*PathSettings)

	// HeaderSettings provides configuration for header management.
	//
	// +optional
	headers?: null | #HeaderSettings @go(Headers,*HeaderSettings)

	// Timeout settings for the client connections.
	//
	// +optional
	timeout?: null | #ClientTimeout @go(Timeout,*ClientTimeout)

	// Connection includes client connection settings.
	//
	// +optional
	connection?: null | #ClientConnection @go(Connection,*ClientConnection)

	// HTTP1 provides HTTP/1 configuration on the listener.
	//
	// +optional
	http1?: null | #HTTP1Settings @go(HTTP1,*HTTP1Settings)

	// HTTP2 provides HTTP/2 configuration on the listener.
	//
	// +optional
	http2?: null | #HTTP2Settings @go(HTTP2,*HTTP2Settings)

	// HTTP3 provides HTTP/3 configuration on the listener.
	//
	// +optional
	http3?: null | #HTTP3Settings @go(HTTP3,*HTTP3Settings)

	// HealthCheck provides configuration for determining whether the HTTP/HTTPS listener is healthy.
	//
	// +optional
	healthCheck?: null | #HealthCheckSettings @go(HealthCheck,*HealthCheckSettings)
}

// HeaderSettings provides configuration options for headers on the listener.
#HeaderSettings: {
	// EnableEnvoyHeaders configures Envoy Proxy to add the "X-Envoy-" headers to requests
	// and responses.
	// +optional
	enableEnvoyHeaders?: null | bool @go(EnableEnvoyHeaders,*bool)

	// DisableRateLimitHeaders configures Envoy Proxy to omit the "X-RateLimit-" response headers
	// when rate limiting is enabled.
	// +optional
	disableRateLimitHeaders?: null | bool @go(DisableRateLimitHeaders,*bool)

	// XForwardedClientCert configures how Envoy Proxy handle the x-forwarded-client-cert (XFCC) HTTP header.
	//
	// x-forwarded-client-cert (XFCC) is an HTTP header used to forward the certificate
	// information of part or all of the clients or proxies that a request has flowed through,
	// on its way from the client to the server.
	//
	// Envoy proxy may choose to sanitize/append/forward the XFCC header before proxying the request.
	//
	// If not set, the default behavior is sanitizing the XFCC header.
	// +optional
	xForwardedClientCert?: null | #XForwardedClientCert @go(XForwardedClientCert,*XForwardedClientCert)

	// WithUnderscoresAction configures the action to take when an HTTP header with underscores
	// is encountered. The default action is to reject the request.
	// +optional
	withUnderscoresAction?: null | #WithUnderscoresAction @go(WithUnderscoresAction,*WithUnderscoresAction)

	// PreserveXRequestID configures Envoy to keep the X-Request-ID header if passed for a request that is edge
	// (Edge request is the request from external clients to front Envoy) and not reset it, which is the current Envoy behaviour.
	// It defaults to false.
	//
	// +optional
	preserveXRequestID?: null | bool @go(PreserveXRequestID,*bool)

	// EarlyRequestHeaders defines settings for early request header modification, before envoy performs
	// routing, tracing and built-in header manipulation.
	//
	// +optional
	earlyRequestHeaders?: null | gwapiv1.#HTTPHeaderFilter @go(EarlyRequestHeaders,*gwapiv1.HTTPHeaderFilter)
}

// WithUnderscoresAction configures the action to take when an HTTP header with underscores
// is encountered.
// +kubebuilder:validation:Enum=Allow;RejectRequest;DropHeader
#WithUnderscoresAction: string // #enumWithUnderscoresAction

#enumWithUnderscoresAction:
	#WithUnderscoresActionAllow |
	#WithUnderscoresActionRejectRequest |
	#WithUnderscoresActionDropHeader

// WithUnderscoresActionAllow allows headers with underscores to be passed through.
#WithUnderscoresActionAllow: #WithUnderscoresAction & "Allow"

// WithUnderscoresActionRejectRequest rejects the client request. HTTP/1 requests are rejected with
// the 400 status. HTTP/2 requests end with the stream reset.
#WithUnderscoresActionRejectRequest: #WithUnderscoresAction & "RejectRequest"

// WithUnderscoresActionDropHeader drops the client header with name containing underscores. The header
// is dropped before the filter chain is invoked and as such filters will not see
// dropped headers.
#WithUnderscoresActionDropHeader: #WithUnderscoresAction & "DropHeader"

// XForwardedClientCert configures how Envoy Proxy handle the x-forwarded-client-cert (XFCC) HTTP header.
// +kubebuilder:validation:XValidation:rule="(has(self.certDetailsToAdd) && self.certDetailsToAdd.size() > 0) ? (self.mode == 'AppendForward' || self.mode == 'SanitizeSet') : true",message="certDetailsToAdd can only be set when mode is AppendForward or SanitizeSet"
#XForwardedClientCert: {
	// Mode defines how XFCC header is handled by Envoy Proxy.
	// If not set, the default mode is `Sanitize`.
	// +optional
	mode?: null | #XFCCForwardMode @go(Mode,*XFCCForwardMode)

	// CertDetailsToAdd specifies the fields in the client certificate to be forwarded in the XFCC header.
	//
	// Hash(the SHA 256 digest of the current client certificate) and By(the Subject Alternative Name)
	// are always included if the client certificate is forwarded.
	//
	// This field is only applicable when the mode is set to `AppendForward` or
	// `SanitizeSet` and the client connection is mTLS.
	// +kubebuilder:validation:MaxItems=5
	// +optional
	certDetailsToAdd?: [...#XFCCCertData] @go(CertDetailsToAdd,[]XFCCCertData)
}

// XFCCForwardMode defines how XFCC header is handled by Envoy Proxy.
// +kubebuilder:validation:Enum=Sanitize;ForwardOnly;AppendForward;SanitizeSet;AlwaysForwardOnly
#XFCCForwardMode: string // #enumXFCCForwardMode

#enumXFCCForwardMode:
	#XFCCForwardModeSanitize |
	#XFCCForwardModeForwardOnly |
	#XFCCForwardModeAppendForward |
	#XFCCForwardModeSanitizeSet |
	#XFCCForwardModeAlwaysForwardOnly

// XFCCForwardModeSanitize removes the XFCC header from the request. This is the default mode.
#XFCCForwardModeSanitize: #XFCCForwardMode & "Sanitize"

// XFCCForwardModeForwardOnly forwards the XFCC header in the request if the client connection is mTLS.
#XFCCForwardModeForwardOnly: #XFCCForwardMode & "ForwardOnly"

// XFCCForwardModeAppendForward appends the client certificate information to the request’s XFCC header and forward it if the client connection is mTLS.
#XFCCForwardModeAppendForward: #XFCCForwardMode & "AppendForward"

// XFCCForwardModeSanitizeSet resets the XFCC header with the client certificate information and forward it if the client connection is mTLS.
// The existing certificate information in the XFCC header is removed.
#XFCCForwardModeSanitizeSet: #XFCCForwardMode & "SanitizeSet"

// XFCCForwardModeAlwaysForwardOnly always forwards the XFCC header in the request, regardless of whether the client connection is mTLS.
#XFCCForwardModeAlwaysForwardOnly: #XFCCForwardMode & "AlwaysForwardOnly"

// XFCCCertData specifies the fields in the client certificate to be forwarded in the XFCC header.
// +kubebuilder:validation:Enum=Subject;Cert;Chain;DNS;URI
#XFCCCertData: string // #enumXFCCCertData

#enumXFCCCertData:
	#XFCCCertDataSubject |
	#XFCCCertDataCert |
	#XFCCCertDataChain |
	#XFCCCertDataDNS |
	#XFCCCertDataURI

// XFCCCertDataSubject is the Subject field of the current client certificate.
#XFCCCertDataSubject: #XFCCCertData & "Subject"

// XFCCCertDataCert is the entire client certificate in URL encoded PEM format.
#XFCCCertDataCert: #XFCCCertData & "Cert"

// XFCCCertDataChain is the entire client certificate chain (including the leaf certificate) in URL encoded PEM format.
#XFCCCertDataChain: #XFCCCertData & "Chain"

// XFCCCertDataDNS is the DNS type Subject Alternative Name field of the current client certificate.
#XFCCCertDataDNS: #XFCCCertData & "DNS"

// XFCCCertDataURI is the URI type Subject Alternative Name field of the current client certificate.
#XFCCCertDataURI: #XFCCCertData & "URI"

// ClientIPDetectionSettings provides configuration for determining the original client IP address for requests.
//
// +kubebuilder:validation:XValidation:rule="!(has(self.xForwardedFor) && has(self.customHeader))",message="customHeader cannot be used in conjunction with xForwardedFor"
#ClientIPDetectionSettings: {
	// XForwardedForSettings provides configuration for using X-Forwarded-For headers for determining the client IP address.
	//
	// +optional
	xForwardedFor?: null | #XForwardedForSettings @go(XForwardedFor,*XForwardedForSettings)

	// CustomHeader provides configuration for determining the client IP address for a request based on
	// a trusted custom HTTP header. This uses the custom_header original IP detection extension.
	// Refer to https://www.envoyproxy.io/docs/envoy/latest/api-v3/extensions/http/original_ip_detection/custom_header/v3/custom_header.proto
	// for more details.
	//
	// +optional
	customHeader?: null | #CustomHeaderExtensionSettings @go(CustomHeader,*CustomHeaderExtensionSettings)
}

// XForwardedForSettings provides configuration for using X-Forwarded-For headers for determining the client IP address.
#XForwardedForSettings: {
	// NumTrustedHops controls the number of additional ingress proxy hops from the right side of XFF HTTP
	// headers to trust when determining the origin client's IP address.
	// Refer to https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_conn_man/headers#x-forwarded-for
	// for more details.
	//
	// +optional
	numTrustedHops?: null | uint32 @go(NumTrustedHops,*uint32)
}

// CustomHeaderExtensionSettings provides configuration for determining the client IP address for a request based on
// a trusted custom HTTP header. This uses the the custom_header original IP detection extension.
// Refer to https://www.envoyproxy.io/docs/envoy/latest/api-v3/extensions/http/original_ip_detection/custom_header/v3/custom_header.proto
// for more details.
#CustomHeaderExtensionSettings: {
	// Name of the header containing the original downstream remote address, if present.
	//
	// +kubebuilder:validation:MinLength=1
	// +kubebuilder:validation:MaxLength=255
	// +kubebuilder:validation:Pattern="^[A-Za-z0-9-]+$"
	//
	name: string @go(Name)

	// FailClosed is a switch used to control the flow of traffic when client IP detection
	// fails. If set to true, the listener will respond with 403 Forbidden when the client
	// IP address cannot be determined.
	//
	// +optional
	failClosed?: null | bool @go(FailClosed,*bool)
}

// HTTP3Settings provides HTTP/3 configuration on the listener.
#HTTP3Settings: {}

// HTTP1Settings provides HTTP/1 configuration on the listener.
#HTTP1Settings: {
	// EnableTrailers defines if HTTP/1 trailers should be proxied by Envoy.
	// +optional
	enableTrailers?: null | bool @go(EnableTrailers,*bool)

	// PreserveHeaderCase defines if Envoy should preserve the letter case of headers.
	// By default, Envoy will lowercase all the headers.
	// +optional
	preserveHeaderCase?: null | bool @go(PreserveHeaderCase,*bool)

	// HTTP10 turns on support for HTTP/1.0 and HTTP/0.9 requests.
	// +optional
	http10?: null | #HTTP10Settings @go(HTTP10,*HTTP10Settings)
}

// HTTP10Settings provides HTTP/1.0 configuration on the listener.
#HTTP10Settings: {
	// UseDefaultHost defines if the HTTP/1.0 request is missing the Host header,
	// then the hostname associated with the listener should be injected into the
	// request.
	// If this is not set and an HTTP/1.0 request arrives without a host, then
	// it will be rejected.
	// +optional
	useDefaultHost?: null | bool @go(UseDefaultHost,*bool)
}

// HealthCheckSettings provides HealthCheck configuration on the HTTP/HTTPS listener.
#HealthCheckSettings: {
	// Path specifies the HTTP path to match on for health check requests.
	// +kubebuilder:validation:MinLength=1
	// +kubebuilder:validation:MaxLength=1024
	path: string @go(Path)
}

// PolicyConditionOverridden indicates whether the policy has
// completely attached to all the sections within the target or not.
//
// Possible reasons for this condition to be True are:
//
// * "Overridden"
//
#PolicyConditionOverridden: gwapiv1a2.#PolicyConditionType & "Overridden"

// PolicyReasonOverridden is used with the "Overridden" condition when the policy
// has been overridden by another policy targeting a section within the same target.
#PolicyReasonOverridden: gwapiv1a2.#PolicyConditionReason & "Overridden"

// ClientTrafficPolicyList contains a list of ClientTrafficPolicy resources.
#ClientTrafficPolicyList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ClientTrafficPolicy] @go(Items,[]ClientTrafficPolicy)
}
