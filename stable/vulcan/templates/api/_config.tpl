{{- define "api-secrets" -}}
{{- if not .Values.comp.db.existingSecret }}
PG_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
{{- end }}
{{- if not .Values.comp.existingSecret }}
SECRET_KEY: {{ .Values.comp.conf.secretKey | b64enc | quote }}
{{- end }}
{{- if not .Values.comp.conf.awscatalogue.existingSecret }}
AWSCATALOGUE_KEY: {{ .Values.comp.conf.awscatalogue.key | b64enc | quote }}
{{- end }}
{{- if .Values.comp.conf.kafka.password }}
KAFKA_PASS: {{ .Values.comp.conf.kafka.password | b64enc | quote }}
{{- end }}
{{- end -}}
