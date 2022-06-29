{{- define "stream-secrets" -}}
REDIS_PWD: {{ include "redis.encryptedPassword" . | quote }}
{{- end -}}
