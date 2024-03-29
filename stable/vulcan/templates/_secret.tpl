{{/*
Creates an standard Secret with the content of .Args.template template and an optional .Args.suffix name.
*/}}
{{- define "common-secret" -}}
{{- if and .Values.comp.enabled }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ template "vulcan.fullname" . }}-{{ .Values.comp.name }}{{ .Args.suffix | default "" }}
  labels: {{- include "vulcan.labels" . | nindent 4 }}
    app.kubernetes.io/name: {{ .Values.comp.name }}
type: Opaque
data:
{{- include .Args.template . | nindent 2 }}
{{- end }}
{{- end -}}
