{{- define "persistence-secrets" -}}
POSTGRES_PASSWORD: {{ .Values.comp.db.password | b64enc | quote }}
SECRET_KEY_BASE: {{ .Values.comp.conf.secretKeyBase | b64enc | quote  }}
{{- end -}}
