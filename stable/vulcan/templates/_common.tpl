{{/*
Lifecycle common preStop
*/}}
{{- define "common-lifecycle" -}}
{{- if or .Values.lifecycle.preStopCommand .Values.lifecycle.preStopSleep -}}
lifecycle:
  preStop:
    exec:
{{- if .Values.lifecycle.preStopCommand }}
      command: {{ .Values.lifecycle.preStopCommand }}
{{- else }}
      command: ["/bin/sh","-c","sleep {{ .Values.lifecycle.preStopSleep }};"]
{{- end -}}
{{- end -}}
{{- end -}}
