{{- define "api.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.api.name -}}
{{- end -}}
