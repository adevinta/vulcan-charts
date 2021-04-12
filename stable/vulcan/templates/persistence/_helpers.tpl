{{- define "persistence.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.persistence.name -}}
{{- end -}}
