{{- define "ui.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.ui.name -}}
{{- end -}}
