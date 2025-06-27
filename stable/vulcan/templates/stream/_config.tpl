{{- define "stream-secrets" -}}
{{- if and (not .Values.comp.redis.existingSecret) .Values.comp.redis.password }}
{{ .Values.comp.redis.passwordKey }}: {{ .Values.comp.redis.password | b64enc }}
{{- end }}
{{- end -}}
