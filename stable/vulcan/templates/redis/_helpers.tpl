{{- define "redis.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.redis.name -}}
{{- end -}}
