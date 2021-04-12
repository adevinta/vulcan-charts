{{- define "insights.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.insights.name -}}
{{- end -}}
