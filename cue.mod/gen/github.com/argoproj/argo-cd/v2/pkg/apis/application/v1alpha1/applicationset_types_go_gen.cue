// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1

package v1alpha1

// Utility struct for a reference to a secret key.
#SecretRef: {
	secretName: string @go(SecretName) @protobuf(1,bytes,opt)
	key:        string @go(Key) @protobuf(2,bytes,opt)
}

// Utility struct for a reference to a configmap key.
#ConfigMapKeyRef: {
	configMapName: string @go(ConfigMapName) @protobuf(1,bytes,opt)
	key:           string @go(Key) @protobuf(2,bytes,opt)
}

// ApplicationSet is a set of Application resources
// +genclient
// +genclient:noStatus
// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object
// +kubebuilder:resource:path=applicationsets,shortName=appset;appsets
// +kubebuilder:subresource:status
#ApplicationSet: {
	spec:    #ApplicationSetSpec   @go(Spec) @protobuf(2,bytes,opt)
	status?: #ApplicationSetStatus @go(Status) @protobuf(3,bytes,opt)
}

// ApplicationSetSpec represents a class of application set state.
#ApplicationSetSpec: {
	goTemplate?: bool @go(GoTemplate) @protobuf(1,bytes)
	generators: [...#ApplicationSetGenerator] @go(Generators,[]ApplicationSetGenerator) @protobuf(2,bytes)
	template:         #ApplicationSetTemplate            @go(Template) @protobuf(3,bytes)
	syncPolicy?:      null | #ApplicationSetSyncPolicy   @go(SyncPolicy,*ApplicationSetSyncPolicy) @protobuf(4,bytes)
	strategy?:        null | #ApplicationSetStrategy     @go(Strategy,*ApplicationSetStrategy) @protobuf(5,bytes,opt)
	preservedFields?: null | #ApplicationPreservedFields @go(PreservedFields,*ApplicationPreservedFields) @protobuf(6,bytes,opt)
	goTemplateOptions?: [...string] @go(GoTemplateOptions,[]string) @protobuf(7,bytes,opt)

	// ApplyNestedSelectors enables selectors defined within the generators of two level-nested matrix or merge generators
	applyNestedSelectors?:         bool                             @go(ApplyNestedSelectors) @protobuf(8,bytes)
	ignoreApplicationDifferences?: #ApplicationSetIgnoreDifferences @go(IgnoreApplicationDifferences) @protobuf(9,bytes)
	templatePatch?:                null | string                    @go(TemplatePatch,*string) @protobuf(10,bytes)
}

#ApplicationPreservedFields: {
	annotations?: [...string] @go(Annotations,[]string) @protobuf(1,bytes)
	labels?: [...string] @go(Labels,[]string) @protobuf(2,bytes)
}

// ApplicationSetStrategy configures how generated Applications are updated in sequence.
#ApplicationSetStrategy: {
	type?:        string                                @go(Type) @protobuf(1,bytes,opt)
	rollingSync?: null | #ApplicationSetRolloutStrategy @go(RollingSync,*ApplicationSetRolloutStrategy) @protobuf(2,bytes,opt)
}

#ApplicationSetRolloutStrategy: {
	steps?: [...#ApplicationSetRolloutStep] @go(Steps,[]ApplicationSetRolloutStep) @protobuf(1,bytes,opt)
}

#ApplicationSetRolloutStep: {
	matchExpressions?: [...#ApplicationMatchExpression] @go(MatchExpressions,[]ApplicationMatchExpression) @protobuf(1,bytes,opt)
}

#ApplicationMatchExpression: {
	key?:      string @go(Key) @protobuf(1,bytes,opt)
	operator?: string @go(Operator) @protobuf(2,bytes,opt)
	values?: [...string] @go(Values,[]string) @protobuf(3,bytes,opt)
}

// ApplicationsSyncPolicy representation
// "create-only" means applications are only created. If the generator's result contains update, applications won't be updated
// "create-update" means applications are only created/Updated. If the generator's result contains update, applications will be updated, but not deleted
// "create-delete" means applications are only created/deleted. If the generator's result contains update, applications won't be updated, if it results in deleted applications, the applications will be deleted
// "sync" means create/update/deleted. If the generator's result contains update, applications will be updated, if it results in deleted applications, the applications will be deleted
// If no ApplicationsSyncPolicy is defined, it defaults it to sync
#ApplicationsSyncPolicy: string // #enumApplicationsSyncPolicy

#enumApplicationsSyncPolicy:
	#ApplicationsSyncPolicyCreateOnly |
	#ApplicationsSyncPolicyCreateUpdate |
	#ApplicationsSyncPolicyCreateDelete |
	#ApplicationsSyncPolicySync

#ApplicationsSyncPolicyCreateOnly:   #ApplicationsSyncPolicy & "create-only"
#ApplicationsSyncPolicyCreateUpdate: #ApplicationsSyncPolicy & "create-update"
#ApplicationsSyncPolicyCreateDelete: #ApplicationsSyncPolicy & "create-delete"
#ApplicationsSyncPolicySync:         #ApplicationsSyncPolicy & "sync"

// ApplicationSetSyncPolicy configures how generated Applications will relate to their
// ApplicationSet.
#ApplicationSetSyncPolicy: {
	// PreserveResourcesOnDeletion will preserve resources on deletion. If PreserveResourcesOnDeletion is set to true, these Applications will not be deleted.
	preserveResourcesOnDeletion?: bool @go(PreserveResourcesOnDeletion) @protobuf(1,bytes,name=syncPolicy)

	// ApplicationsSync represents the policy applied on the generated applications. Possible values are create-only, create-update, create-delete, sync
	// +kubebuilder:validation:Optional
	// +kubebuilder:validation:Enum=create-only;create-update;create-delete;sync
	applicationsSync?: null | #ApplicationsSyncPolicy @go(ApplicationsSync,*ApplicationsSyncPolicy) @protobuf(2,bytes,opt,casttype=ApplicationsSyncPolicy)
}

// ApplicationSetIgnoreDifferences configures how the ApplicationSet controller will ignore differences in live
// applications when applying changes from generated applications.
#ApplicationSetIgnoreDifferences: [...#ApplicationSetResourceIgnoreDifferences]

// ApplicationSetResourceIgnoreDifferences configures how the ApplicationSet controller will ignore differences in live
// applications when applying changes from generated applications.
#ApplicationSetResourceIgnoreDifferences: {
	// Name is the name of the application to ignore differences for. If not specified, the rule applies to all applications.
	name?: string @go(Name) @protobuf(1,bytes)

	// JSONPointers is a list of JSON pointers to fields to ignore differences for.
	jsonPointers?: [...string] @go(JSONPointers,[]string) @protobuf(2,bytes)

	// JQPathExpressions is a list of JQ path expressions to fields to ignore differences for.
	jqPathExpressions?: [...string] @go(JQPathExpressions,[]string) @protobuf(3,bytes,name=jqExpressions)
}

// ApplicationSetTemplate represents argocd ApplicationSpec
#ApplicationSetTemplate: {
	metadata: #ApplicationSetTemplateMeta @go(ApplicationSetTemplateMeta) @protobuf(1,bytes)
	spec:     #ApplicationSpec            @go(Spec) @protobuf(2,bytes)
}

// ApplicationSetTemplateMeta represents the Argo CD application fields that may
// be used for Applications generated from the ApplicationSet (based on metav1.ObjectMeta)
#ApplicationSetTemplateMeta: {
	name?:      string @go(Name) @protobuf(1,bytes)
	namespace?: string @go(Namespace) @protobuf(2,bytes)
	labels?: {[string]: string} @go(Labels,map[string]string) @protobuf(3,bytes)
	annotations?: {[string]: string} @go(Annotations,map[string]string) @protobuf(4,bytes)
	finalizers?: [...string] @go(Finalizers,[]string) @protobuf(5,bytes)
}

// ApplicationSetGenerator represents a generator at the top level of an ApplicationSet.
#ApplicationSetGenerator: {
	list?:                    null | #ListGenerator        @go(List,*ListGenerator) @protobuf(1,bytes)
	clusters?:                null | #ClusterGenerator     @go(Clusters,*ClusterGenerator) @protobuf(2,bytes)
	git?:                     null | #GitGenerator         @go(Git,*GitGenerator) @protobuf(3,bytes)
	scmProvider?:             null | #SCMProviderGenerator @go(SCMProvider,*SCMProviderGenerator) @protobuf(4,bytes)
	clusterDecisionResource?: null | #DuckTypeGenerator    @go(ClusterDecisionResource,*DuckTypeGenerator) @protobuf(5,bytes)
	pullRequest?:             null | #PullRequestGenerator @go(PullRequest,*PullRequestGenerator) @protobuf(6,bytes)
	matrix?:                  null | #MatrixGenerator      @go(Matrix,*MatrixGenerator) @protobuf(7,bytes)
	merge?:                   null | #MergeGenerator       @go(Merge,*MergeGenerator) @protobuf(8,bytes)
	plugin?:                  null | #PluginGenerator      @go(Plugin,*PluginGenerator) @protobuf(10,bytes)
}

// ApplicationSetNestedGenerator represents a generator nested within a combination-type generator (MatrixGenerator or
// MergeGenerator).
#ApplicationSetNestedGenerator: {
	list?:                    null | #ListGenerator        @go(List,*ListGenerator) @protobuf(1,bytes)
	clusters?:                null | #ClusterGenerator     @go(Clusters,*ClusterGenerator) @protobuf(2,bytes)
	git?:                     null | #GitGenerator         @go(Git,*GitGenerator) @protobuf(3,bytes)
	scmProvider?:             null | #SCMProviderGenerator @go(SCMProvider,*SCMProviderGenerator) @protobuf(4,bytes)
	clusterDecisionResource?: null | #DuckTypeGenerator    @go(ClusterDecisionResource,*DuckTypeGenerator) @protobuf(5,bytes)
	pullRequest?:             null | #PullRequestGenerator @go(PullRequest,*PullRequestGenerator) @protobuf(6,bytes)
	plugin?:                  null | #PluginGenerator      @go(Plugin,*PluginGenerator) @protobuf(10,bytes)
}

#ApplicationSetNestedGenerators: [...#ApplicationSetNestedGenerator]

// ApplicationSetTerminalGenerator represents a generator nested within a nested generator (for example, a list within
// a merge within a matrix). A generator at this level may not be a combination-type generator (MatrixGenerator or
// MergeGenerator). ApplicationSet enforces this nesting depth limit because CRDs do not support recursive types.
// https://github.com/kubernetes-sigs/controller-tools/issues/477
#ApplicationSetTerminalGenerator: {
	list?:                    null | #ListGenerator        @go(List,*ListGenerator) @protobuf(1,bytes)
	clusters?:                null | #ClusterGenerator     @go(Clusters,*ClusterGenerator) @protobuf(2,bytes)
	git?:                     null | #GitGenerator         @go(Git,*GitGenerator) @protobuf(3,bytes)
	scmProvider?:             null | #SCMProviderGenerator @go(SCMProvider,*SCMProviderGenerator) @protobuf(4,bytes)
	clusterDecisionResource?: null | #DuckTypeGenerator    @go(ClusterDecisionResource,*DuckTypeGenerator) @protobuf(5,bytes)
	pullRequest?:             null | #PullRequestGenerator @go(PullRequest,*PullRequestGenerator) @protobuf(6,bytes)
	plugin?:                  null | #PluginGenerator      @go(Plugin,*PluginGenerator) @protobuf(7,bytes)
}

#ApplicationSetTerminalGenerators: [...#ApplicationSetTerminalGenerator]

// ListGenerator include items info
#ListGenerator: {
	template?:     #ApplicationSetTemplate @go(Template) @protobuf(2,bytes)
	elementsYaml?: string                  @go(ElementsYaml) @protobuf(3,bytes,opt)
}

// MatrixGenerator generates the cartesian product of two sets of parameters. The parameters are defined by two nested
// generators.
#MatrixGenerator: {
	generators: [...#ApplicationSetNestedGenerator] @go(Generators,[]ApplicationSetNestedGenerator) @protobuf(1,bytes)
	template?: #ApplicationSetTemplate @go(Template) @protobuf(2,bytes)
}

// NestedMatrixGenerator is a MatrixGenerator nested under another combination-type generator (MatrixGenerator or
// MergeGenerator). NestedMatrixGenerator does not have an override template, because template overriding has no meaning
// within the constituent generators of combination-type generators.
//
// NOTE: Nested matrix generator is not included directly in the CRD struct, instead it is included
// as a generic 'apiextensionsv1.JSON' object, and then marshalled into a NestedMatrixGenerator
// when processed.
#NestedMatrixGenerator: {
	generators: #ApplicationSetTerminalGenerators @go(Generators) @protobuf(1,bytes)
}

// MergeGenerator merges the output of two or more generators. Where the values for all specified merge keys are equal
// between two sets of generated parameters, the parameter sets will be merged with the parameters from the latter
// generator taking precedence. Parameter sets with merge keys not present in the base generator's params will be
// ignored.
// For example, if the first generator produced [{a: '1', b: '2'}, {c: '1', d: '1'}] and the second generator produced
// [{'a': 'override'}], the united parameters for merge keys = ['a'] would be
// [{a: 'override', b: '1'}, {c: '1', d: '1'}].
//
// MergeGenerator supports template overriding. If a MergeGenerator is one of multiple top-level generators, its
// template will be merged with the top-level generator before the parameters are applied.
#MergeGenerator: {
	generators: [...#ApplicationSetNestedGenerator] @go(Generators,[]ApplicationSetNestedGenerator) @protobuf(1,bytes)
	mergeKeys: [...string] @go(MergeKeys,[]string) @protobuf(2,bytes)
	template?: #ApplicationSetTemplate @go(Template) @protobuf(3,bytes)
}

// NestedMergeGenerator is a MergeGenerator nested under another combination-type generator (MatrixGenerator or
// MergeGenerator). NestedMergeGenerator does not have an override template, because template overriding has no meaning
// within the constituent generators of combination-type generators.
//
// NOTE: Nested merge generator is not included directly in the CRD struct, instead it is included
// as a generic 'apiextensionsv1.JSON' object, and then marshalled into a NestedMergeGenerator
// when processed.
#NestedMergeGenerator: {
	generators: #ApplicationSetTerminalGenerators @go(Generators) @protobuf(1,bytes)
	mergeKeys: [...string] @go(MergeKeys,[]string) @protobuf(2,bytes)
}

// ClusterGenerator defines a generator to match against clusters registered with ArgoCD.
#ClusterGenerator: {
	template?: #ApplicationSetTemplate @go(Template) @protobuf(2,bytes)

	// Values contains key/value pairs which are passed directly as parameters to the template
	values?: {[string]: string} @go(Values,map[string]string) @protobuf(3,bytes)

	// returns the clusters a single 'clusters' value in the template
	flatList?: bool @go(FlatList) @protobuf(4,bytes)
}

// DuckType defines a generator to match against clusters registered with ArgoCD.
#DuckTypeGenerator: {
	// ConfigMapRef is a ConfigMap with the duck type definitions needed to retrieve the data
	//              this includes apiVersion(group/version), kind, matchKey and validation settings
	// Name is the resource name of the kind, group and version, defined in the ConfigMapRef
	// RequeueAfterSeconds is how long before the duckType will be rechecked for a change
	configMapRef:         string                  @go(ConfigMapRef) @protobuf(1,bytes)
	name?:                string                  @go(Name) @protobuf(2,bytes)
	requeueAfterSeconds?: null | int64            @go(RequeueAfterSeconds,*int64) @protobuf(3,bytes)
	template?:            #ApplicationSetTemplate @go(Template) @protobuf(5,bytes)

	// Values contains key/value pairs which are passed directly as parameters to the template
	values?: {[string]: string} @go(Values,map[string]string) @protobuf(6,bytes)
}

#GitGenerator: {
	repoURL: string @go(RepoURL) @protobuf(1,bytes)
	directories?: [...#GitDirectoryGeneratorItem] @go(Directories,[]GitDirectoryGeneratorItem) @protobuf(2,bytes)
	files?: [...#GitFileGeneratorItem] @go(Files,[]GitFileGeneratorItem) @protobuf(3,bytes)
	revision:             string                  @go(Revision) @protobuf(4,bytes)
	requeueAfterSeconds?: null | int64            @go(RequeueAfterSeconds,*int64) @protobuf(5,bytes)
	template?:            #ApplicationSetTemplate @go(Template) @protobuf(6,bytes)
	pathParamPrefix?:     string                  @go(PathParamPrefix) @protobuf(7,bytes)

	// Values contains key/value pairs which are passed directly as parameters to the template
	values?: {[string]: string} @go(Values,map[string]string) @protobuf(8,bytes)
}

#GitDirectoryGeneratorItem: {
	path:     string @go(Path) @protobuf(1,bytes)
	exclude?: bool   @go(Exclude) @protobuf(2,bytes)
}

#GitFileGeneratorItem: {
	path: string @go(Path) @protobuf(1,bytes)
}

// SCMProviderGenerator defines a generator that scrapes a SCMaaS API to find candidate repos.
#SCMProviderGenerator: {
	// Which provider to use and config for it.
	github?:          null | #SCMProviderGeneratorGithub          @go(Github,*SCMProviderGeneratorGithub) @protobuf(1,bytes,opt)
	gitlab?:          null | #SCMProviderGeneratorGitlab          @go(Gitlab,*SCMProviderGeneratorGitlab) @protobuf(2,bytes,opt)
	bitbucket?:       null | #SCMProviderGeneratorBitbucket       @go(Bitbucket,*SCMProviderGeneratorBitbucket) @protobuf(3,bytes,opt)
	bitbucketServer?: null | #SCMProviderGeneratorBitbucketServer @go(BitbucketServer,*SCMProviderGeneratorBitbucketServer) @protobuf(4,bytes,opt)
	gitea?:           null | #SCMProviderGeneratorGitea           @go(Gitea,*SCMProviderGeneratorGitea) @protobuf(5,bytes,opt)
	azureDevOps?:     null | #SCMProviderGeneratorAzureDevOps     @go(AzureDevOps,*SCMProviderGeneratorAzureDevOps) @protobuf(6,bytes,opt)

	// Filters for which repos should be considered.
	filters?: [...#SCMProviderGeneratorFilter] @go(Filters,[]SCMProviderGeneratorFilter) @protobuf(7,bytes,rep)

	// Which protocol to use for the SCM URL. Default is provider-specific but ssh if possible. Not all providers
	// necessarily support all protocols.
	cloneProtocol?: string @go(CloneProtocol) @protobuf(8,bytes,opt)

	// Standard parameters.
	requeueAfterSeconds?: null | int64            @go(RequeueAfterSeconds,*int64) @protobuf(9,varint,opt)
	template?:            #ApplicationSetTemplate @go(Template) @protobuf(10,bytes,opt)

	// Values contains key/value pairs which are passed directly as parameters to the template
	values?: {[string]: string} @go(Values,map[string]string) @protobuf(11,bytes)
	awsCodeCommit?: null | #SCMProviderGeneratorAWSCodeCommit @go(AWSCodeCommit,*SCMProviderGeneratorAWSCodeCommit) @protobuf(12,bytes,opt)
}

// SCMProviderGeneratorGitea defines a connection info specific to Gitea.
#SCMProviderGeneratorGitea: {
	// Gitea organization or user to scan. Required.
	owner: string @go(Owner) @protobuf(1,bytes,opt)

	// The Gitea URL to talk to. For example https://gitea.mydomain.com/.
	api: string @go(API) @protobuf(2,bytes,opt)

	// Authentication token reference.
	tokenRef?: null | #SecretRef @go(TokenRef,*SecretRef) @protobuf(3,bytes,opt)

	// Scan all branches instead of just the default branch.
	allBranches?: bool @go(AllBranches) @protobuf(4,varint,opt)

	// Allow self-signed TLS / Certificates; default: false
	insecure?: bool @go(Insecure) @protobuf(5,varint,opt)
}

// SCMProviderGeneratorGithub defines connection info specific to GitHub.
#SCMProviderGeneratorGithub: {
	// GitHub org to scan. Required.
	organization: string @go(Organization) @protobuf(1,bytes,opt)

	// The GitHub API URL to talk to. If blank, use https://api.github.com/.
	api?: string @go(API) @protobuf(2,bytes,opt)

	// Authentication token reference.
	tokenRef?: null | #SecretRef @go(TokenRef,*SecretRef) @protobuf(3,bytes,opt)

	// AppSecretName is a reference to a GitHub App repo-creds secret.
	appSecretName?: string @go(AppSecretName) @protobuf(4,bytes,opt)

	// Scan all branches instead of just the default branch.
	allBranches?: bool @go(AllBranches) @protobuf(5,varint,opt)
}

// SCMProviderGeneratorGitlab defines connection info specific to Gitlab.
#SCMProviderGeneratorGitlab: {
	// Gitlab group to scan. Required.  You can use either the project id (recommended) or the full namespaced path.
	group: string @go(Group) @protobuf(1,bytes,opt)

	// Recurse through subgroups (true) or scan only the base group (false).  Defaults to "false"
	includeSubgroups?: bool @go(IncludeSubgroups) @protobuf(2,varint,opt)

	// The Gitlab API URL to talk to.
	api?: string @go(API) @protobuf(3,bytes,opt)

	// Authentication token reference.
	tokenRef?: null | #SecretRef @go(TokenRef,*SecretRef) @protobuf(4,bytes,opt)

	// Scan all branches instead of just the default branch.
	allBranches?: bool @go(AllBranches) @protobuf(5,varint,opt)

	// Skips validating the SCM provider's TLS certificate - useful for self-signed certificates.; default: false
	insecure?: bool @go(Insecure) @protobuf(6,varint,opt)

	// When recursing through subgroups, also include shared Projects (true) or scan only the subgroups under same path (false).  Defaults to "true"
	includeSharedProjects?: null | bool @go(IncludeSharedProjects,*bool) @protobuf(7,varint,opt)

	// Filter repos list based on Gitlab Topic.
	topic?: string @go(Topic) @protobuf(8,bytes,opt)

	// ConfigMap key holding the trusted certificates
	caRef?: null | #ConfigMapKeyRef @go(CARef,*ConfigMapKeyRef) @protobuf(9,bytes,opt)
}

// SCMProviderGeneratorBitbucket defines connection info specific to Bitbucket Cloud (API version 2).
#SCMProviderGeneratorBitbucket: {
	// Bitbucket workspace to scan. Required.
	owner: string @go(Owner) @protobuf(1,bytes,opt)

	// Bitbucket user to use when authenticating.  Should have a "member" role to be able to read all repositories and branches.  Required
	user: string @go(User) @protobuf(2,bytes,opt)

	// The app password to use for the user.  Required. See: https://support.atlassian.com/bitbucket-cloud/docs/app-passwords/
	appPasswordRef?: null | #SecretRef @go(AppPasswordRef,*SecretRef) @protobuf(3,bytes,opt)

	// Scan all branches instead of just the main branch.
	allBranches?: bool @go(AllBranches) @protobuf(4,varint,opt)
}

// SCMProviderGeneratorBitbucketServer defines connection info specific to Bitbucket Server.
#SCMProviderGeneratorBitbucketServer: {
	// Project to scan. Required.
	project: string @go(Project) @protobuf(1,bytes,opt)

	// The Bitbucket Server REST API URL to talk to. Required.
	api: string @go(API) @protobuf(2,bytes,opt)

	// Credentials for Basic auth
	basicAuth?: null | #BasicAuthBitbucketServer @go(BasicAuth,*BasicAuthBitbucketServer) @protobuf(3,bytes,opt)

	// Scan all branches instead of just the default branch.
	allBranches?: bool @go(AllBranches) @protobuf(4,varint,opt)

	// Credentials for AccessToken (Bearer auth)
	bearerToken?: null | #BearerTokenBitbucket @go(BearerToken,*BearerTokenBitbucket) @protobuf(5,bytes,opt)

	// Allow self-signed TLS / Certificates; default: false
	insecure?: bool @go(Insecure) @protobuf(6,varint,opt)

	// ConfigMap key holding the trusted certificates
	caRef?: null | #ConfigMapKeyRef @go(CARef,*ConfigMapKeyRef) @protobuf(7,bytes,opt)
}

// SCMProviderGeneratorAzureDevOps defines connection info specific to Azure DevOps.
#SCMProviderGeneratorAzureDevOps: {
	// Azure Devops organization. Required. E.g. "my-organization".
	organization: string @go(Organization) @protobuf(5,bytes,opt)

	// The URL to Azure DevOps. If blank, use https://dev.azure.com.
	api?: string @go(API) @protobuf(6,bytes,opt)

	// Azure Devops team project. Required. E.g. "my-team".
	teamProject: string @go(TeamProject) @protobuf(7,bytes,opt)

	// The Personal Access Token (PAT) to use when connecting. Required.
	accessTokenRef?: null | #SecretRef @go(AccessTokenRef,*SecretRef) @protobuf(8,bytes,opt)

	// Scan all branches instead of just the default branch.
	allBranches?: bool @go(AllBranches) @protobuf(9,varint,opt)
}

#TagFilter: {
	key:    string @go(Key) @protobuf(1,bytes,opt)
	value?: string @go(Value) @protobuf(2,bytes,opt)
}

// SCMProviderGeneratorAWSCodeCommit defines connection info specific to AWS CodeCommit.
#SCMProviderGeneratorAWSCodeCommit: {
	// TagFilters provides the tag filter(s) for repo discovery
	tagFilters?: [...null | #TagFilter] @go(TagFilters,[]*TagFilter) @protobuf(1,bytes,opt)

	// Role provides the AWS IAM role to assume, for cross-account repo discovery
	// if not provided, AppSet controller will use its pod/node identity to discover.
	role?: string @go(Role) @protobuf(2,bytes,opt)

	// Region provides the AWS region to discover repos.
	// if not provided, AppSet controller will infer the current region from environment.
	region?: string @go(Region) @protobuf(3,bytes,opt)

	// Scan all branches instead of just the default branch.
	allBranches?: bool @go(AllBranches) @protobuf(4,varint,opt)
}

// SCMProviderGeneratorFilter is a single repository filter.
// If multiple filter types are set on a single struct, they will be AND'd together. All filters must
// pass for a repo to be included.
#SCMProviderGeneratorFilter: {
	// A regex for repo names.
	repositoryMatch?: null | string @go(RepositoryMatch,*string) @protobuf(1,bytes,opt)

	// An array of paths, all of which must exist.
	pathsExist?: [...string] @go(PathsExist,[]string) @protobuf(2,bytes,rep)

	// An array of paths, all of which must not exist.
	pathsDoNotExist?: [...string] @go(PathsDoNotExist,[]string) @protobuf(3,bytes,rep)

	// A regex which must match at least one label.
	labelMatch?: null | string @go(LabelMatch,*string) @protobuf(4,bytes,opt)

	// A regex which must match the branch name.
	branchMatch?: null | string @go(BranchMatch,*string) @protobuf(5,bytes,opt)
}

// PullRequestGenerator defines a generator that scrapes a PullRequest API to find candidate pull requests.
#PullRequestGenerator: {
	// Which provider to use and config for it.
	github?:          null | #PullRequestGeneratorGithub          @go(Github,*PullRequestGeneratorGithub) @protobuf(1,bytes,opt)
	gitlab?:          null | #PullRequestGeneratorGitLab          @go(GitLab,*PullRequestGeneratorGitLab) @protobuf(2,bytes,opt)
	gitea?:           null | #PullRequestGeneratorGitea           @go(Gitea,*PullRequestGeneratorGitea) @protobuf(3,bytes,opt)
	bitbucketServer?: null | #PullRequestGeneratorBitbucketServer @go(BitbucketServer,*PullRequestGeneratorBitbucketServer) @protobuf(4,bytes,opt)

	// Filters for which pull requests should be considered.
	filters?: [...#PullRequestGeneratorFilter] @go(Filters,[]PullRequestGeneratorFilter) @protobuf(5,bytes,rep)

	// Standard parameters.
	requeueAfterSeconds?: null | int64                          @go(RequeueAfterSeconds,*int64) @protobuf(6,varint,opt)
	template?:            #ApplicationSetTemplate               @go(Template) @protobuf(7,bytes,opt)
	bitbucket?:           null | #PullRequestGeneratorBitbucket @go(Bitbucket,*PullRequestGeneratorBitbucket) @protobuf(8,bytes,opt)

	// Additional provider to use and config for it.
	azuredevops?: null | #PullRequestGeneratorAzureDevOps @go(AzureDevOps,*PullRequestGeneratorAzureDevOps) @protobuf(9,bytes,opt)
}

// PullRequestGeneratorGitea defines connection info specific to Gitea.
#PullRequestGeneratorGitea: {
	// Gitea org or user to scan. Required.
	owner: string @go(Owner) @protobuf(1,bytes,opt)

	// Gitea repo name to scan. Required.
	repo: string @go(Repo) @protobuf(2,bytes,opt)

	// The Gitea API URL to talk to. Required
	api: string @go(API) @protobuf(3,bytes,opt)

	// Authentication token reference.
	tokenRef?: null | #SecretRef @go(TokenRef,*SecretRef) @protobuf(4,bytes,opt)

	// Allow insecure tls, for self-signed certificates; default: false.
	insecure?: bool @go(Insecure) @protobuf(5,varint,opt)
}

// PullRequestGeneratorAzureDevOps defines connection info specific to AzureDevOps.
#PullRequestGeneratorAzureDevOps: {
	// Azure DevOps org to scan. Required.
	organization: string @go(Organization) @protobuf(1,bytes,opt)

	// Azure DevOps project name to scan. Required.
	project: string @go(Project) @protobuf(2,bytes,opt)

	// Azure DevOps repo name to scan. Required.
	repo: string @go(Repo) @protobuf(3,bytes,opt)

	// The Azure DevOps API URL to talk to. If blank, use https://dev.azure.com/.
	api?: string @go(API) @protobuf(4,bytes,opt)

	// Authentication token reference.
	tokenRef?: null | #SecretRef @go(TokenRef,*SecretRef) @protobuf(5,bytes,opt)

	// Labels is used to filter the PRs that you want to target
	labels?: [...string] @go(Labels,[]string) @protobuf(6,bytes,rep)
}

// PullRequestGenerator defines connection info specific to GitHub.
#PullRequestGeneratorGithub: {
	// GitHub org or user to scan. Required.
	owner: string @go(Owner) @protobuf(1,bytes,opt)

	// GitHub repo name to scan. Required.
	repo: string @go(Repo) @protobuf(2,bytes,opt)

	// The GitHub API URL to talk to. If blank, use https://api.github.com/.
	api?: string @go(API) @protobuf(3,bytes,opt)

	// Authentication token reference.
	tokenRef?: null | #SecretRef @go(TokenRef,*SecretRef) @protobuf(4,bytes,opt)

	// AppSecretName is a reference to a GitHub App repo-creds secret with permission to access pull requests.
	appSecretName?: string @go(AppSecretName) @protobuf(5,bytes,opt)

	// Labels is used to filter the PRs that you want to target
	labels?: [...string] @go(Labels,[]string) @protobuf(6,bytes,rep)
}

// PullRequestGeneratorGitLab defines connection info specific to GitLab.
#PullRequestGeneratorGitLab: {
	// GitLab project to scan. Required.
	project: string @go(Project) @protobuf(1,bytes,opt)

	// The GitLab API URL to talk to. If blank, uses https://gitlab.com/.
	api?: string @go(API) @protobuf(2,bytes,opt)

	// Authentication token reference.
	tokenRef?: null | #SecretRef @go(TokenRef,*SecretRef) @protobuf(3,bytes,opt)

	// Labels is used to filter the MRs that you want to target
	labels?: [...string] @go(Labels,[]string) @protobuf(4,bytes,rep)

	// PullRequestState is an additional MRs filter to get only those with a certain state. Default: "" (all states)
	pullRequestState?: string @go(PullRequestState) @protobuf(5,bytes,rep)

	// Skips validating the SCM provider's TLS certificate - useful for self-signed certificates.; default: false
	insecure?: bool @go(Insecure) @protobuf(6,varint,opt)

	// ConfigMap key holding the trusted certificates
	caRef?: null | #ConfigMapKeyRef @go(CARef,*ConfigMapKeyRef) @protobuf(7,bytes,opt)
}

// PullRequestGeneratorBitbucketServer defines connection info specific to BitbucketServer.
#PullRequestGeneratorBitbucketServer: {
	// Project to scan. Required.
	project: string @go(Project) @protobuf(1,bytes,opt)

	// Repo name to scan. Required.
	repo: string @go(Repo) @protobuf(2,bytes,opt)

	// The Bitbucket REST API URL to talk to e.g. https://bitbucket.org/rest Required.
	api: string @go(API) @protobuf(3,bytes,opt)

	// Credentials for Basic auth
	basicAuth?: null | #BasicAuthBitbucketServer @go(BasicAuth,*BasicAuthBitbucketServer) @protobuf(4,bytes,opt)

	// Credentials for AccessToken (Bearer auth)
	bearerToken?: null | #BearerTokenBitbucket @go(BearerToken,*BearerTokenBitbucket) @protobuf(5,bytes,opt)

	// Allow self-signed TLS / Certificates; default: false
	insecure?: bool @go(Insecure) @protobuf(6,varint,opt)

	// ConfigMap key holding the trusted certificates
	caRef?: null | #ConfigMapKeyRef @go(CARef,*ConfigMapKeyRef) @protobuf(7,bytes,opt)
}

// PullRequestGeneratorBitbucket defines connection info specific to Bitbucket.
#PullRequestGeneratorBitbucket: {
	// Workspace to scan. Required.
	owner: string @go(Owner) @protobuf(1,bytes,opt)

	// Repo name to scan. Required.
	repo: string @go(Repo) @protobuf(2,bytes,opt)

	// The Bitbucket REST API URL to talk to. If blank, uses https://api.bitbucket.org/2.0.
	api?: string @go(API) @protobuf(3,bytes,opt)

	// Credentials for Basic auth
	basicAuth?: null | #BasicAuthBitbucketServer @go(BasicAuth,*BasicAuthBitbucketServer) @protobuf(4,bytes,opt)

	// Credentials for AppToken (Bearer auth)
	bearerToken?: null | #BearerTokenBitbucketCloud @go(BearerToken,*BearerTokenBitbucketCloud) @protobuf(5,bytes,opt)
}

// BearerTokenBitbucket defines the Bearer token for BitBucket AppToken auth.
#BearerTokenBitbucket: {
	// Password (or personal access token) reference.
	tokenRef?: null | #SecretRef @go(TokenRef,*SecretRef) @protobuf(1,bytes,opt)
}

// BearerTokenBitbucketCloud defines the Bearer token for BitBucket AppToken auth.
#BearerTokenBitbucketCloud: {
	// Password (or personal access token) reference.
	tokenRef?: null | #SecretRef @go(TokenRef,*SecretRef) @protobuf(1,bytes,opt)
}

// BasicAuthBitbucketServer defines the username/(password or personal access token) for Basic auth.
#BasicAuthBitbucketServer: {
	// Username for Basic auth
	username: string @go(Username) @protobuf(1,bytes,opt)

	// Password (or personal access token) reference.
	passwordRef?: null | #SecretRef @go(PasswordRef,*SecretRef) @protobuf(2,bytes,opt)
}

// PullRequestGeneratorFilter is a single pull request filter.
// If multiple filter types are set on a single struct, they will be AND'd together. All filters must
// pass for a pull request to be included.
#PullRequestGeneratorFilter: {
	branchMatch?:       null | string @go(BranchMatch,*string) @protobuf(1,bytes,opt)
	targetBranchMatch?: null | string @go(TargetBranchMatch,*string) @protobuf(2,bytes,opt)
}

#PluginConfigMapRef: {
	// Name of the ConfigMap
	name: string @go(Name) @protobuf(1,bytes,opt)
}

// PluginGenerator defines connection info specific to Plugin.
#PluginGenerator: {
	configMapRef: #PluginConfigMapRef @go(ConfigMapRef) @protobuf(1,bytes)

	// RequeueAfterSeconds determines how long the ApplicationSet controller will wait before reconciling the ApplicationSet again.
	requeueAfterSeconds?: null | int64            @go(RequeueAfterSeconds,*int64) @protobuf(3,varint,opt)
	template?:            #ApplicationSetTemplate @go(Template) @protobuf(4,bytes)

	// Values contains key/value pairs which are passed directly as parameters to the template. These values will not be
	// sent as parameters to the plugin.
	values?: {[string]: string} @go(Values,map[string]string) @protobuf(5,bytes)
}

// ApplicationSetStatus defines the observed state of ApplicationSet
#ApplicationSetStatus: {
	// INSERT ADDITIONAL STATUS FIELD - define observed state of cluster
	// Important: Run "make" to regenerate code after modifying this file
	conditions?: [...#ApplicationSetCondition] @go(Conditions,[]ApplicationSetCondition) @protobuf(1,bytes)
	applicationStatus?: [...#ApplicationSetApplicationStatus] @go(ApplicationStatus,[]ApplicationSetApplicationStatus) @protobuf(2,bytes)

	// Resources is a list of Applications resources managed by this application set.
	resources?: [...#ResourceStatus] @go(Resources,[]ResourceStatus) @protobuf(3,bytes,opt)
}

// ApplicationSetCondition contains details about an applicationset condition, which is usually an error or warning
#ApplicationSetCondition: {
	// Type is an applicationset condition type
	type: #ApplicationSetConditionType @go(Type) @protobuf(1,bytes,opt)

	// Message contains human-readable message indicating details about condition
	message: string @go(Message) @protobuf(2,bytes,opt)

	// True/False/Unknown
	status: #ApplicationSetConditionStatus @go(Status) @protobuf(4,bytes,opt)

	// Single word camelcase representing the reason for the status eg ErrorOccurred
	reason: string @go(Reason) @protobuf(5,bytes,opt)
}

// SyncStatusCode is a type which represents possible comparison results
#ApplicationSetConditionStatus: string // #enumApplicationSetConditionStatus

#enumApplicationSetConditionStatus:
	#ApplicationSetConditionStatusTrue |
	#ApplicationSetConditionStatusFalse |
	#ApplicationSetConditionStatusUnknown

// ApplicationSetConditionStatusTrue indicates that a application has been successfully established
#ApplicationSetConditionStatusTrue: #ApplicationSetConditionStatus & "True"

// ApplicationSetConditionStatusFalse indicates that a application attempt has failed
#ApplicationSetConditionStatusFalse: #ApplicationSetConditionStatus & "False"

// ApplicationSetConditionStatusUnknown indicates that the application condition status could not be reliably determined
#ApplicationSetConditionStatusUnknown: #ApplicationSetConditionStatus & "Unknown"

// ApplicationSetConditionType represents type of application condition. Type name has following convention:
// prefix "Error" means error condition
// prefix "Warning" means warning condition
// prefix "Info" means informational condition
#ApplicationSetConditionType: string // #enumApplicationSetConditionType

#enumApplicationSetConditionType:
	#ApplicationSetConditionErrorOccurred |
	#ApplicationSetConditionParametersGenerated |
	#ApplicationSetConditionResourcesUpToDate |
	#ApplicationSetConditionRolloutProgressing

#ApplicationSetConditionErrorOccurred:       #ApplicationSetConditionType & "ErrorOccurred"
#ApplicationSetConditionParametersGenerated: #ApplicationSetConditionType & "ParametersGenerated"
#ApplicationSetConditionResourcesUpToDate:   #ApplicationSetConditionType & "ResourcesUpToDate"
#ApplicationSetConditionRolloutProgressing:  #ApplicationSetConditionType & "RolloutProgressing"

#ApplicationSetReasonType: string

#ApplicationSetReasonErrorOccurred:                    "ErrorOccurred"
#ApplicationSetReasonApplicationSetUpToDate:           "ApplicationSetUpToDate"
#ApplicationSetReasonParametersGenerated:              "ParametersGenerated"
#ApplicationSetReasonApplicationGenerated:             "ApplicationGeneratedSuccessfully"
#ApplicationSetReasonUpdateApplicationError:           "UpdateApplicationError"
#ApplicationSetReasonApplicationParamsGenerationError: "ApplicationGenerationFromParamsError"
#ApplicationSetReasonRenderTemplateParamsError:        "RenderTemplateParamsError"
#ApplicationSetReasonCreateApplicationError:           "CreateApplicationError"
#ApplicationSetReasonDeleteApplicationError:           "DeleteApplicationError"
#ApplicationSetReasonRefreshApplicationError:          "RefreshApplicationError"
#ApplicationSetReasonApplicationValidationError:       "ApplicationValidationError"
#ApplicationSetReasonApplicationSetModified:           "ApplicationSetModified"
#ApplicationSetReasonApplicationSetRolloutComplete:    "ApplicationSetRolloutComplete"
#ApplicationSetReasonSyncApplicationError:             "SyncApplicationError"

// ApplicationSetApplicationStatus contains details about each Application managed by the ApplicationSet
#ApplicationSetApplicationStatus: {
	// Application contains the name of the Application resource
	application: string @go(Application) @protobuf(1,bytes,opt)

	// Message contains human-readable message indicating details about the status
	message: string @go(Message) @protobuf(3,bytes,opt)

	// Status contains the AppSet's perceived status of the managed Application resource: (Waiting, Pending, Progressing, Healthy)
	status: string @go(Status) @protobuf(4,bytes,opt)

	// Step tracks which step this Application should be updated in
	step: string @go(Step) @protobuf(5,bytes,opt)

	// TargetRevision tracks the desired revisions the Application should be synced to.
	targetRevisions: [...string] @go(TargetRevisions,[]string) @protobuf(6,bytes,opt,name=targetrevisions)
}

// ApplicationSetList contains a list of ApplicationSet
// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object
// +kubebuilder:object:root=true
#ApplicationSetList: {
	items: [...#ApplicationSet] @go(Items,[]ApplicationSet) @protobuf(2,bytes,rep)
}

// ApplicationSetTree holds nodes which belongs to the application
// Used to build a tree of an ApplicationSet and its children
#ApplicationSetTree: {
	// Nodes contains list of nodes which are directly managed by the applicationset
	nodes?: [...#ResourceNode] @go(Nodes,[]ResourceNode) @protobuf(1,bytes,rep)
}
