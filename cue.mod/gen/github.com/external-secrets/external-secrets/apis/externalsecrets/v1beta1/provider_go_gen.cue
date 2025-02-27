// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

// Ready indicates that the client is configured correctly
// and can be used.
#ValidationResultReady: #ValidationResult & 0

// Unknown indicates that the client can be used
// but information is missing and it can not be validated.
#ValidationResultUnknown: #ValidationResult & 1

// Error indicates that there is a misconfiguration.
#ValidationResultError: #ValidationResult & 2

#ValidationResult: uint8 // #enumValidationResult

#enumValidationResult:
	#ValidationResultReady |
	#ValidationResultUnknown |
	#ValidationResultError

#values_ValidationResult: {
	ValidationResultReady:   #ValidationResultReady
	ValidationResultUnknown: #ValidationResultUnknown
	ValidationResultError:   #ValidationResultError
}

// Provider is a common interface for interacting with secret backends.
#Provider: _

// SecretsClient provides access to secrets.
#SecretsClient: _

// NoSecretError shall be returned when a GetSecret can not find the
// desired secret. This is used for deletionPolicy.
#NoSecretError: {}

// NotModifiedError to signal that the webhook received no changes,
// and it should just return without doing anything.
#NotModifiedError: {}
