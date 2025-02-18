package apps

import (
	"strings"
	"list"
)

#SyncPolicy: {
	auto: {
		automated: {}
		syncOptions: #DefaultSyncOptions
	}
	autoSSA: {
		automated: {}
		syncOptions: #DefaultSSASyncOptions_1
	}
	autoPrune: {
		automated: prune: true
		syncOptions: #DefaultSyncOptions
	}
	autoPruneReplace: {
		automated: prune: true
		syncOptions: #DefaultReplaceSyncOptions_5
	}
	autoPruneSSA: {
		automated: prune: true
		syncOptions: #DefaultSSASyncOptions_A
	}
}

#DefaultSyncOptions: [
	"CreateNamespace=false",
	"PruneLast=true",
	"ApplyOutOfSyncOnly=true",
	"SkipDryRunOnMissingResource=true",
]

#DefaultSSASyncOptions: list.Concat([#DefaultSyncOptions, ["ServerSideApply=true"]])
#DefaultReplaceSyncOptions: list.Concat([#DefaultSyncOptions, ["Replace=true"]])

#GrafanaAnnotations: {
	tags: [...string]
	out: {for trigger in triggers {
		"notifications.argoproj.io/subscribe.\(trigger).grafana": strings.Join(tags, "|")
	}
	}
}

let triggers = [
	"on-created",
	"on-deleted",
	"on-deployed",
	"on-health-degraded",
	"on-sync-failed",
	"on-sync-running",
	"on-sync-status-unknown",
	"on-sync-succeeded",
]

let #DefaultSSASyncOptions_1 = #DefaultSSASyncOptions

let #DefaultReplaceSyncOptions_5 = #DefaultReplaceSyncOptions

let #DefaultSSASyncOptions_A = #DefaultSSASyncOptions
