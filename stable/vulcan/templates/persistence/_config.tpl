{{- define "persistence-secrets" -}}
{{- if and (not .Values.postgresql.enabled) (not .Values.comp.db.existingSecret) }}
{{ .Values.comp.db.passwordKey }}: {{ .Values.comp.db.password | b64enc | quote }}
{{- end }}
{{- if not .Values.comp.conf.existingSecret }}
{{ .Values.comp.conf.secretKeyBaseKey }}: {{ .Values.comp.conf.secretKeyBase | b64enc | quote }}
{{- end }}
{{- end -}}
