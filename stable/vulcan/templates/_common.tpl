{{- define "common-manifests" -}}
{{- include "common-proxy-config-map" . }}
{{- end -}}

{{- define "common-annotations" -}}
{{- include "common-proxy-annotations" . }}
{{- end -}}

{{/*
Lifecycle common preStop
*/}}
{{- define "common-lifecycle" -}}
{{- if .Values.comp.lifecycle -}}
{{- if or .Values.comp.lifecycle.preStopCommand .Values.comp.lifecycle.preStopSleep -}}
lifecycle:
  preStop:
    exec:
{{- if .Values.comp.lifecycle.preStopCommand }}
      command: {{ .Values.comp.lifecycle.preStopCommand }}
{{- else }}
      command: ["/bin/sh","-c","sleep {{ .Values.comp.lifecycle.preStopSleep }};"]
{{- end -}}
{{- end -}}
{{- end -}}
{{- if .Values.comp.livenessProbe -}}
{{- if and .Values.comp.livenessProbe.enabled (or .Values.comp.livenessProbe.command .Values.comp.livenessProbe.path )}}
livenessProbe:
{{- if .Values.comp.livenessProbe.command }}
  exec:
    command: {{ .Values.comp.livenessProbe.command }}
{{- else }}
  httpGet:
    path: {{ .Values.comp.livenessProbe.path }}
    port: {{ .Values.comp.containerPort }}
{{- end }}
  initialDelaySeconds: {{ .Values.comp.livenessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.comp.livenessProbe.periodSeconds }}
  timeoutSeconds: {{ .Values.comp.livenessProbe.timeoutSeconds }}
  successThreshold: {{ .Values.comp.livenessProbe.successThreshold }}
  failureThreshold: {{ .Values.comp.livenessProbe.failureThreshold }}
{{- end }}
{{- end }}
{{- if .Values.comp.readinessProbe -}}
{{- if and .Values.comp.readinessProbe.enabled (or .Values.comp.readinessProbe.command .Values.comp.readinessProbe.path )}}
readinessProbe:
{{- if .Values.comp.readinessProbe.command }}
  exec:
    command: {{ .Values.comp.readinessProbe.command }}
{{- else }}
  httpGet:
    path: {{ .Values.comp.readinessProbe.path }}
    port: {{ .Values.comp.containerPort }}
{{- end }}
  initialDelaySeconds: {{ .Values.comp.readinessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.comp.readinessProbe.periodSeconds }}
  timeoutSeconds: {{ .Values.comp.readinessProbe.timeoutSeconds }}
  successThreshold: {{ .Values.comp.readinessProbe.successThreshold }}
  failureThreshold: {{ .Values.comp.readinessProbe.failureThreshold }}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "common-spec" -}}
{{- if .Values.comp.terminationGracePeriodSeconds -}}
terminationGracePeriodSeconds: {{ .Values.comp.terminationGracePeriodSeconds }}
{{- end -}}
{{- end -}}

{{- define "common-containers" -}}
{{- include "common-dogstatsd-sidecar" . }}
{{- include "common-proxy-container" . }}
{{- end -}}

{{- define "common-envs" -}}
{{ include "common-infra-envs" . }}
{{ include "common-dogstatsd-envs" . }}
{{- end -}}

{{- define "common-volumes" -}}
{{- include "common-proxy-volumes" . }}
{{- end -}}

{{- define "common-appPortName" -}}
{{- if .Values.comp.proxy -}}
{{- ternary "app" "http" .Values.comp.proxy.enabled -}}
{{- else -}}
http
{{- end -}}
{{- end -}}
