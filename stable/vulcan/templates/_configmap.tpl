{{/*
Creates an standard ConfigMap with the content of .Args.template template and an optional .Args.suffix name
*/}}
{{- define "common-configmap" -}}
{{- if and .Values.comp.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include  "comp.fullname" . }}{{ .Args.suffix | default "" }}
  labels: {{- include "vulcan.labels" . | nindent 4 }}
    app.kubernetes.io/name: {{ .Values.comp.name }}
data:
{{- include .Args.template . | nindent 2 }}
{{- end }}
{{- end -}}
