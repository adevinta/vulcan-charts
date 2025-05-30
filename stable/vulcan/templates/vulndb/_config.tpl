{{- define "vulndb-secrets" -}}
{{- if not .Values.comp.db.existingSecret }}
PG_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
{{- end }}
{{- end -}}
