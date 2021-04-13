{{- define "common-manifests" -}}
{{- include "proxy-config-map" . }}
{{- end -}}

{{- define "common-annotations" -}}
{{- include "proxy-annotations" . }}
{{- end -}}

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
{{- if .Values.livenessProbe.command }}
  exec:
    command: {{ .Values.livenessProbe.command }}
{{- else }}
  httpGet:
    path: {{ .Values.livenessProbe.path }}
    port: {{ .Values.containerPort }}
{{- end }}
  initialDelaySeconds: {{ .Values.livenessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.livenessProbe.periodSeconds }}
  timeoutSeconds: {{ .Values.livenessProbe.timeoutSeconds }}
  successThreshold: {{ .Values.livenessProbe.successThreshold }}
  failureThreshold: {{ .Values.livenessProbe.failureThreshold }}
{{- end }}
{{- if .Values.readinessProbe.enabled }}
readinessProbe:
{{- if .Values.readinessProbe.command }}
  exec:
    command: {{ .Values.readinessProbe.command }}
{{- else }}
  httpGet:
    path: {{ .Values.readinessProbe.path }}
    port: {{ .Values.containerPort }}
{{- end }}
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

{{- define "common-containers" -}}
{{- include "dogstatsd-sidecar" . }}
{{- include "proxy-container" . }}
{{- end -}}

{{- define "common-envs" -}}
{{ include "infra-envs" . }}
{{ include "dogstatsd-envs" . }}
{{- end -}}

{{- define "common-volumes" -}}
{{- include "proxy-volumes" . }}
{{- end -}}

{{- define "common-appPortName" -}}
{{- if .Values.proxy -}}
{{- ternary "app" "http" .Values.proxy.enabled -}}
{{- else -}}
http
{{- end -}}
{{- end -}}

{{- define "region" -}}
{{- .Values.global.region -}}
{{- end -}}

{{- define "domain" -}}
{{- .Values.global.domain -}}
{{- end -}}

{{/*
Override names
*/}}
{{- define "persistenceHost" -}}
{{- printf "%s-persistence" .Release.Name -}}
{{- end -}}

{{- define "vulcanApi" -}}
{{- printf "http://%s-api/api" .Release.Name -}}
{{- end -}}

{{- define "scanengineUrl" -}}
{{- printf "http://%s-scanengine" .Release.Name -}}
{{- end -}}

{{- define "crontinuousUrl" -}}
{{- printf "http://%s-crontinuous/" .Release.Name -}}
{{- end -}}

{{- define "persistenceUrl" -}}
{{- printf "http://%s-persistence" .Release.Name -}}
{{- end -}}

{{- define "resultsUrl" -}}
{{- printf "http://%s-results" .Release.Name -}}
{{- end -}}

{{- define "resultsHost" -}}
{{- printf "%s-results" .Release.Name -}}
{{- end -}}

{{- define "reportsgeneratorUrl" -}}
{{- printf "http://%s-reportsgenerator/" .Release.Name -}}
{{- end -}}

{{- define "vulndbapiUrl" -}}
{{- printf "http://%s-vulndbapi/" .Release.Name -}}
{{- end -}}

{{- define "vulndbUrl" -}}
{{- printf "http://%s-vulndb/" .Release.Name -}}
{{- end -}}

{{- define "streamUrl" -}}
{{- printf "http://%s-stream" .Release.Name -}}
{{- end -}}

{{- define "redisAddr" -}}
{{- printf "%s-redis:6379" .Release.Name -}}
{{- end -}}

{{- define "minioEndpoint" -}}
{{- printf "http://%s-minio" .Release.Name -}}
{{- end -}}

{{- define "sqsEndpoint" -}}
{{- printf "http://%s-goaws" .Release.Name -}}
{{- end -}}

{{- define "snsEndpoint" -}}
{{- printf "http://%s-goaws" .Release.Name -}}
{{- end -}}

{{- define "postgresqlHost" -}}
{{- printf "%s-postgresql" .Release.Name -}}
{{- end -}}
