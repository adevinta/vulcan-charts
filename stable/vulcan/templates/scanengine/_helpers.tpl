{{- define "scanengine.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.scanengine.name -}}
{{- end -}}
