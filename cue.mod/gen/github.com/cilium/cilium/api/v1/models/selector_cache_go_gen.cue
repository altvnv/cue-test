// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// SelectorCache cache of which identities match selectors in the policy repository
//
// swagger:model SelectorCache
#SelectorCache: [...null | #SelectorIdentityMapping]
