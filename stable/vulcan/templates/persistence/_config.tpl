{{- define "persistence-secrets" -}}
{{- if not .Values.comp.db.existingSecret }}
POSTGRES_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
{{- end }}
{{- if not .Values.comp.existingSecret }}
SECRET_KEY_BASE: {{ .Values.comp.conf.secretKeyBase | b64enc | quote  }}
{{- end }}
{{- end -}}
