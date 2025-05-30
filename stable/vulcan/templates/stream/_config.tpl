{{- define "stream-secrets" -}}
{{- if not .Values.comp.redis.existingSecret }}
REDIS_PWD: {{ include "vulcan.redis.encryptedPassword" . | quote }}
{{- end }}
{{- end -}}
