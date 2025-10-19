{{- define "hello-k8s.name" -}}
hello-k8s
{{- end -}}

{{- define "hello-k8s.fullname" -}}
{{- printf "%s" (include "hello-k8s.name" .) -}}
{{- end -}}
