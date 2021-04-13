{{- define "vulndb.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.vulndb.name -}}
{{- end -}}
