{{- define "comp-common-manifests" -}}
{{- include "comp-proxy-config-map" . }}
{{- end -}}

{{- define "comp-common-annotations" -}}
{{- include "comp-proxy-annotations" . }}
{{- end -}}

{{/*
Lifecycle common preStop
*/}}
{{- define "comp-common-lifecycle" -}}
{{- if .comp.lifecycle -}}
{{- if or .comp.lifecycle.preStopCommand .comp.lifecycle.preStopSleep -}}
lifecycle:
  preStop:
    exec:
{{- if .comp.lifecycle.preStopCommand }}
      command: {{ .comp.lifecycle.preStopCommand }}
{{- else }}
      command: ["/bin/sh","-c","sleep {{ .comp.lifecycle.preStopSleep }};"]
{{- end -}}
{{- end -}}
{{- end -}}
{{- if .comp.livenessProbe -}}
{{- if and .comp.livenessProbe.enabled (or .comp.livenessProbe.command .comp.livenessProbe.path )}}
livenessProbe:
{{- if .comp.livenessProbe.command }}
  exec:
    command: {{ .comp.livenessProbe.command }}
{{- else }}
  httpGet:
    path: {{ .comp.livenessProbe.path }}
    port: {{ .comp.containerPort }}
{{- end }}
  initialDelaySeconds: {{ .comp.livenessProbe.initialDelaySeconds }}
  periodSeconds: {{ .comp.livenessProbe.periodSeconds }}
  timeoutSeconds: {{ .comp.livenessProbe.timeoutSeconds }}
  successThreshold: {{ .comp.livenessProbe.successThreshold }}
  failureThreshold: {{ .comp.livenessProbe.failureThreshold }}
{{- end }}
{{- end }}
{{- if .comp.readinessProbe -}}
{{- if and .comp.readinessProbe.enabled (or .comp.readinessProbe.command .comp.readinessProbe.path )}}
readinessProbe:
{{- if .comp.readinessProbe.command }}
  exec:
    command: {{ .comp.readinessProbe.command }}
{{- else }}
  httpGet:
    path: {{ .comp.readinessProbe.path }}
    port: {{ .comp.containerPort }}
{{- end }}
  initialDelaySeconds: {{ .comp.readinessProbe.initialDelaySeconds }}
  periodSeconds: {{ .comp.readinessProbe.periodSeconds }}
  timeoutSeconds: {{ .comp.readinessProbe.timeoutSeconds }}
  successThreshold: {{ .comp.readinessProbe.successThreshold }}
  failureThreshold: {{ .comp.readinessProbe.failureThreshold }}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "comp-common-spec" -}}
{{- if .comp.terminationGracePeriodSeconds -}}
terminationGracePeriodSeconds: {{ .comp.terminationGracePeriodSeconds }}
{{- end -}}
{{- end -}}

{{- define "comp-common-containers" -}}
{{- include "comp-dogstatsd-sidecar" . }}
{{- include "comp-proxy-container" . }}
{{- end -}}

{{- define "comp-common-envs" -}}
{{ include "comp-infra-envs" . }}
{{ include "comp-dogstatsd-envs" . }}
{{- end -}}

{{- define "comp-common-volumes" -}}
{{- include "comp-proxy-volumes" . }}
{{- end -}}

{{- define "comp-common-appPortName" -}}
{{- if .comp.proxy -}}
{{- ternary "app" "http" .comp.proxy.enabled -}}
{{- else -}}
http
{{- end -}}
{{- end -}}
