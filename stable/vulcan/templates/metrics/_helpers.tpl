{{- define "metrics.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.metrics.name -}}
{{- end -}}
