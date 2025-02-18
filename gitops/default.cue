package gitops

_vaultUrl: "https://vault.eth.p2p.world"
_cluster:  string

_team:         *"etherno" | string
_project:      string
_cluster:      string
_cluster_type: string
_location:     string
_owner:        *"etherno" | string

_defaultMetadataLabels: {
	team:         _team
	project:      _project
	cluster:      _cluster
	cluster_type: _cluster_type
	location:     _location
	owner:        _owner
}

_GKEAutopilotToleration: [{
	effect:   "NoSchedule"
	key:      "cloud.google.com/machine-family"
	operator: "Exists"
}, {
	effect:   "NoSchedule"
	key:      "cloud.google.com/pods-per-node"
	operator: "Exists"
}, {
	effect:   "NoSchedule"
	key:      "kubernetes.io/arch"
	operator: "Equal"
	value:    "amd64"
}]
