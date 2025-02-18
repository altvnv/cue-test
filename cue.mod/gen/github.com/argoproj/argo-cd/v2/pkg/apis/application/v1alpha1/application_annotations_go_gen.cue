// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1

package v1alpha1

// AnnotationKeyRefresh is the annotation key which indicates that app needs to be refreshed. Removed by application controller after app is refreshed.
// Might take values 'normal'/'hard'. Value 'hard' means manifest cache and target cluster state cache should be invalidated before refresh.
#AnnotationKeyRefresh: "argocd.argoproj.io/refresh"

// AnnotationKeyHydrate is the annotation key which indicates that app needs to be hydrated. Removed by application controller after app is hydrated.
#AnnotationKeyHydrate: "argocd.argoproj.io/hydrate"

// AnnotationKeyManifestGeneratePaths is an annotation that contains a list of semicolon-separated paths in the
// manifests repository that affects the manifest generation. Paths might be either relative or absolute. The
// absolute path means an absolute path within the repository and the relative path is relative to the application
// source path within the repository.
#AnnotationKeyManifestGeneratePaths: "argocd.argoproj.io/manifest-generate-paths"
