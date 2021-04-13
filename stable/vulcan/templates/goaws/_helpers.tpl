{{- define "goaws.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.goaws.name -}}
{{- end -}}
