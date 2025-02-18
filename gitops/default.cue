package gitops

_cluster:  string

_team:         *"chainlink" | string
_project:      string
_cluster:      string
_cluster_type: string
_location:     string
_owner:        *"chainlink" | string

_defaultMetadataLabels: {
	team:         _team
	project:      _project
	cluster:      _cluster
	cluster_type: _cluster_type
	location:     _location
	owner:        _owner
}
