{{- define "vulndbapi-secrets" -}}
{{- if not .Values.comp.db.existingSecret }}
PG_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
PG_PASSWORD_READ: {{ include "pg.encryptedPassword" . | quote }}
{{- end }}
{{- end -}}
