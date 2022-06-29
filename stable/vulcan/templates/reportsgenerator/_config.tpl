{{- define "reportsgenerator-secrets" -}}
PG_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
{{- end -}}
