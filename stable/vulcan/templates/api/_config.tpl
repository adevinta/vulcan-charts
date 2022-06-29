{{- define "api-secrets" -}}
PG_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
SECRET_KEY: {{ .Values.comp.conf.secretKey | b64enc | quote }}
AWSCATALOGUE_KEY: {{ .Values.comp.conf.awscatalogue.key | b64enc | quote }}
{{- end -}}
