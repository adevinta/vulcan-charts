{{- define "crontinuous-secrets" -}}
{{- if not .Values.comp.conf.existingSecret }}
{{ .Values.comp.conf.vulcanTokenKey }}: {{ .Values.comp.conf.vulcanToken | b64enc }}
{{- end }}
{{- end -}}
