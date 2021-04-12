{{- define "stream.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.stream.name -}}
{{- end -}}
