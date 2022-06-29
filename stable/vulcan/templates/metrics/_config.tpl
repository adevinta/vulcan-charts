{{- define "metrics-secrets" -}}
DEVHOSE_TOKEN: {{ .Values.comp.conf.devHoseToken | b64enc | quote }}
VULCAN_API_TOKEN: {{ .Values.comp.conf.vulcanAPIToken | b64enc | quote }}
{{- end -}}
