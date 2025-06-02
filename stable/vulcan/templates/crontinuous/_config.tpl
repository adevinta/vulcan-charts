{{- define "crontinuous-secrets" -}}
{{- if not .Values.comp.conf.existingSecret }}
VULCAN_TOKEN: {{ .Values.comp.conf.vulcanToken | b64enc | quote }}
{{- end }}
{{- end -}}
