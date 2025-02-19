// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/pkg/policy/api

package api

// AuthenticationMode is a string identifying a supported authentication type
#AuthenticationMode: string // #enumAuthenticationMode

#enumAuthenticationMode:
	#AuthenticationModeDisabled |
	#AuthenticationModeRequired |
	#AuthenticationModeAlwaysFail

#AuthenticationModeDisabled:   #AuthenticationMode & "disabled"
#AuthenticationModeRequired:   #AuthenticationMode & "required"
#AuthenticationModeAlwaysFail: #AuthenticationMode & "test-always-fail"

// Authentication specifies the kind of cryptographic authentication required for the traffic to
// be allowed.
#Authentication: {
	// Mode is the required authentication mode for the allowed traffic, if any.
	//
	// +kubebuilder:validation:Enum=disabled;required;test-always-fail
	// +kubebuilder:validation:Required
	mode: #AuthenticationMode @go(Mode)
}

// Rule is a policy rule which must be applied to all endpoints which match the
// labels contained in the endpointSelector
//
// Each rule is split into an ingress section which contains all rules
// applicable at ingress, and an egress section applicable at egress. For rule
// types such as `L4Rule` and `CIDR` which can be applied at both ingress and
// egress, both ingress and egress side have to either specifically allow the
// connection or one side has to be omitted.
//
// Either ingress, egress, or both can be provided. If both ingress and egress
// are omitted, the rule has no effect.
//
// +deepequal-gen:private-method=true
#Rule: _
