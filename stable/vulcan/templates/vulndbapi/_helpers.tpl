{{- define "vulndbapi.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.vulndbapi.name -}}
{{- end -}}
