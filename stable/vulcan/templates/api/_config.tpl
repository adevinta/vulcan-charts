{{- define "api-secrets" -}}
PG_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
SECRET_KEY: {{ .Values.comp.conf.secretKey | b64enc | quote }}
AWSCATALOGUE_KEY: {{ .Values.comp.conf.awscatalogue.key | b64enc | quote }}
{{- if .Values.comp.conf.kafka.password }}
KAFKA_PASS: {{ .Values.comp.conf.kafka.password | b64enc | quote }}
{{- end }}
{{- end -}}
