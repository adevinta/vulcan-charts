{{- define "results.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.results.name -}}
{{- end -}}
