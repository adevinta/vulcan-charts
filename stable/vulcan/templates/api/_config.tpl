{{- define "api-secrets" -}}
{{- if and (not .Values.postgresql.enabled) (not .Values.comp.db.existingSecret) }}
{{ .Values.comp.db.passwordKey }}: {{ .Values.comp.db.password | b64enc | quote }}
{{- end }}
{{- if not .Values.comp.conf.existingSecret }}
{{ .Values.comp.conf.secretKeyKey }}: {{ .Values.comp.conf.secretKey | b64enc | quote }}
{{- end }}
{{- if not .Values.comp.conf.awscatalogue.existingSecret }}
{{ .Values.comp.conf.awscatalogue.keyKey }}: {{ .Values.comp.conf.awscatalogue.key | b64enc | quote }}
{{- end }}
{{- if not .Values.comp.conf.kafka.existingSecret }}
{{ .Values.comp.conf.kafka.passwordKey }}: {{ .Values.comp.conf.kafka.password | b64enc | quote }}
{{- end }}
{{- end }}
