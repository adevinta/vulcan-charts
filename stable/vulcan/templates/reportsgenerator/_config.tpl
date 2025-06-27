{{- define "reportsgenerator-secrets" -}}
{{- if and (not .Values.postgresql.enabled) (not .Values.comp.db.existingSecret) }}
{{ .Values.comp.db.passwordKey }}: {{ .Values.comp.db.password | b64enc | quote }}
{{- end }}
{{- end -}}
