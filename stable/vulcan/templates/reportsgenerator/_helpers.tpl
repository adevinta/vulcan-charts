{{- define "reportsgenerator.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.reportsgenerator.name -}}
{{- end -}}
