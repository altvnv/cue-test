// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/pkg/policy/api

package api

// Decision is a reachability policy decision
#Decision: _ // #enumDecision

#enumDecision:
	#Undecided |
	#Allowed |
	#Denied

#values_Decision: {
	Undecided: #Undecided
	Allowed:   #Allowed
	Denied:    #Denied
}

// Undecided means that we have not come to a decision yet
#Undecided: #Decision & 0

// Allowed means that reachability is allowed
#Allowed: #Decision & 1

// Denied means that reachability is denied
#Denied: #Decision & 2
