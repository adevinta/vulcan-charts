{{- define "scanengine-secrets" -}}
PG_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
{{- if .Values.comp.conf.queues.redisEnabled }}
REDIS_PWD: {{ include "vulcan.redis.encryptedPassword" . | quote }}
{{- end }}
{{- end -}}
