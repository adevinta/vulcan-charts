{{- define "crontinuous.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.crontinuous.name -}}
{{- end -}}
