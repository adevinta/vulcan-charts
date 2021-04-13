{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "vulcan.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vulcan.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vulcan.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "vulcan.labels" -}}
helm.sh/chart: {{ include "vulcan.chart" . }}
{{ include "vulcan.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "vulcan.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vulcan.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "api.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.api.name -}}
{{- end -}}

{{- define "crontinuous.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.crontinuous.name -}}
{{- end -}}

{{- define "goaws.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.goaws.name -}}
{{- end -}}

{{- define "insights.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.insights.name -}}
{{- end -}}

{{- define "metrics.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.metrics.name -}}
{{- end -}}

{{- define "persistence.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.persistence.name -}}
{{- end -}}

{{- define "redis.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.redis.name -}}
{{- end -}}

{{- define "reportsgenerator.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.reportsgenerator.name -}}
{{- end -}}

{{- define "results.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.results.name -}}
{{- end -}}

{{- define "scanengine.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.scanengine.name -}}
{{- end -}}

{{- define "stream.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.stream.name -}}
{{- end -}}

{{- define "ui.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.ui.name -}}
{{- end -}}

{{- define "vulndb.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.vulndb.name -}}
{{- end -}}

{{- define "vulndbapi.fullname" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.vulndbapi.name -}}
{{- end -}}

{{- define "region" -}}
{{- .Values.global.region -}}
{{- end -}}

{{- define "domain" -}}
{{- .Values.global.domain -}}
{{- end -}}

{{- define "apiUrl" -}}
{{- printf "http://%s/api" (include "api.fullname" .) -}}
{{- end -}}

{{- define "scanengineUrl" -}}
{{- printf "http://%s" (include "scanengine.fullname" .) -}}
{{- end -}}

{{- define "crontinuousUrl" -}}
{{- printf "http://%s/" (include "crontinuous.fullname" .) -}}
{{- end -}}

{{- define "persistenceUrl" -}}
{{- printf "http://%s" (include "persistence.fullname" .) -}}
{{- end -}}

{{- define "resultsUrl" -}}
{{- printf "http://%s" (include "results.fullname" .) -}}
{{- end -}}

{{- define "reportsgeneratorUrl" -}}
{{- printf "http://%s/" (include "reportsgenerator.fullname" .) -}}
{{- end -}}

{{- define "vulndbapiUrl" -}}
{{- printf "http://%s/" (include "vulndbapi.fullname" .) -}}
{{- end -}}

{{- define "vulndbUrl" -}}
{{- printf "http://%s/" (include "vulndb.fullname" .) -}}
{{- end -}}

{{- define "streamUrl" -}}
{{- printf "http://%s" (include "stream.fullname" .) -}}
{{- end -}}

{{- define "redisAddr" -}}
{{- printf "%s:6379" (include "redis.fullname" .) -}}
{{- end -}}

{{- define "minioEndpoint" -}}
{{- printf "http://%s-minio" .Release.Name -}}
{{- end -}}

{{- define "sqsEndpoint" -}}
{{- printf "http://%s" (include "goaws.fullname" .) -}}
{{- end -}}

{{- define "snsEndpoint" -}}
{{- printf "http://%s" (include "goaws.fullname" .) -}}
{{- end -}}

{{- define "postgresqlHost" -}}
{{- printf "%s-postgresql" .Release.Name -}}
{{- end -}}
