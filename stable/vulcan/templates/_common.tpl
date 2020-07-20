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
{{- printf "http://%s-scanengine/v1/" .Release.Name -}}
{{- end -}}

{{- define "crontinuousUrl" -}}
{{- printf "http://%s-crontinuous/" .Release.Name -}}
{{- end -}}

{{- define "persistenceEndpoint" -}}
{{- printf "http://%s-persistence" .Release.Name -}}
{{- end -}}

{{- define "resultsEndpoint" -}}
{{- printf "http://%s-results" .Release.Name -}}
{{- end -}}

{{- define "resultsHost" -}}
{{- printf "%s-results" .Release.Name -}}
{{- end -}}

{{- define "reportsgeneratorUrl" -}}
{{- printf "http://%s-reportsgenerator/" .Release.Name -}}
{{- end -}}

{{- define "defaultBackendHost" -}}
{{- printf "%s-ui-db" .Release.Name -}}
{{- end -}}

{{- define "metricsRedisAddr" -}}
{{- printf "%s-metrics-redis:6379" .Release.Name -}}
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

{{- define "api.hostname" -}}
{{- printf "%s.%s" "www" .Values.global.domain -}}
{{- end -}}

{{- define "goaws.hostname" -}}
{{- printf "%s.%s" "goaws" .Values.global.domain -}}
{{- end -}}

{{- define "crontinuous.hostname" -}}
{{- printf "%s.%s" "crontinuous" .Values.global.domain -}}
{{- end -}}

{{- define "insights.hostname" -}}
{{- printf "%s.%s" "insights" .Values.global.domain -}}
{{- end -}}

{{- define "persistence.hostname" -}}
{{- printf "%s.%s" "persistence" .Values.global.domain -}}
{{- end -}}

{{- define "results.hostname" -}}
{{- printf "%s.%s" "results" .Values.global.domain -}}
{{- end -}}

{{- define "scanengine.hostname" -}}
{{- printf "%s.%s" "scanengine" .Values.global.domain -}}
{{- end -}}

{{- define "reportsgenerator.hostname" -}}
{{- printf "%s.%s" "reportsgenerator" .Values.global.domain -}}
{{- end -}}

{{- define "stream.hostname" -}}
{{- printf "%s.%s" "stream" .Values.global.domain -}}
{{- end -}}

{{- define "ui.hostname" -}}
{{- printf "%s.%s" "www" .Values.global.domain -}}
{{- end -}}

{{- define "postgresqlHost" -}}
{{- printf "%s-postgresql" .Release.Name -}}
{{- end -}}
