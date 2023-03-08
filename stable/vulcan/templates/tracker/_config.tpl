{{- define "tracker-secrets" -}}
PG_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
{{- end -}}
