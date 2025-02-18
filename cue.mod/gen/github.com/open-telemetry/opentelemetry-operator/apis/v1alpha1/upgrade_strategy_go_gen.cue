// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/open-telemetry/opentelemetry-operator/apis/v1alpha1

package v1alpha1

#UpgradeStrategy: string // #enumUpgradeStrategy

#enumUpgradeStrategy:
	#UpgradeStrategyAutomatic |
	#UpgradeStrategyNone

// UpgradeStrategyAutomatic specifies that the operator will automatically apply upgrades to the CR.
#UpgradeStrategyAutomatic: #UpgradeStrategy & "automatic"

// UpgradeStrategyNone specifies that the operator will not apply any upgrades to the CR.
#UpgradeStrategyNone: #UpgradeStrategy & "none"
