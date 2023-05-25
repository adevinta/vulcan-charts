{{- define "stream-secrets" -}}
REDIS_PWD: {{ include "vulcan.redis.encryptedPassword" . | quote }}
{{- end -}}
