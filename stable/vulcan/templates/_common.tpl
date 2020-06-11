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
{{- if .Values.livenessProbe.enabled }}
livenessProbe:
  httpGet:
    path: {{ .Values.livenessProbe.path }}
    port: {{ .Values.containerPort }}
initialDelaySeconds: {{ .Values.livenessProbe.initialDelaySeconds }}
periodSeconds: {{ .Values.livenessProbe.periodSeconds }}
timeoutSeconds: {{ .Values.livenessProbe.timeoutSeconds }}
successThreshold: {{ .Values.livenessProbe.successThreshold }}
failureThreshold: {{ .Values.livenessProbe.failureThreshold }}
{{- end }}
{{- if .Values.readinessProbe.enabled }}
readinessProbe:
  httpGet:
    path: {{ .Values.readinessProbe.path }}
    port: {{ .Values.containerPort }}
initialDelaySeconds: {{ .Values.readinessProbe.initialDelaySeconds }}
periodSeconds: {{ .Values.readinessProbe.periodSeconds }}
timeoutSeconds: {{ .Values.readinessProbe.timeoutSeconds }}
successThreshold: {{ .Values.readinessProbe.successThreshold }}
failureThreshold: {{ .Values.readinessProbe.failureThreshold }}
{{- end }}
{{- end -}}

{{- define "common-spec" -}}
{{- if .Values.terminationGracePeriodSeconds -}}
terminationGracePeriodSeconds: {{ .Values.terminationGracePeriodSeconds }}
{{- end -}}
{{- end -}}

