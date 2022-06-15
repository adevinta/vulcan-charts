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
app.kubernetes.io/instance: {{ include "vulcan.name" . }}
{{- end -}}

{{/*
Pod labels
*/}}
{{- define "vulcan.podLabels" -}}
{{- include "vulcan.selectorLabels" . -}}
{{- $root := . -}}
{{- with .Values.global.podLabels }}
{{ tpl (toYaml .) $root }}
{{- end }}
{{- with .Values.comp.extraPodLabels }}
{{ tpl (toYaml .) $root }}
{{- end }}
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

{{- define "api.url" -}}
{{- printf "http://%s/api" (include "api.fullname" .) -}}
{{- end -}}

{{- define "scanengine.url" -}}
{{- printf "http://%s" (include "scanengine.fullname" .) -}}
{{- end -}}

{{- define "crontinuous.url" -}}
{{- printf "http://%s/" (include "crontinuous.fullname" .) -}}
{{- end -}}

{{- define "results.url" -}}
{{- printf "http://%s" (include "results.fullname" .) -}}
{{- end -}}

{{- define "reportsgenerator.url" -}}
{{- printf "http://%s/" (include "reportsgenerator.fullname" .) -}}
{{- end -}}

{{- define "vulndbapi.url" -}}
{{- printf "http://%s/" (include "vulndbapi.fullname" .) -}}
{{- end -}}

{{- define "stream.url" -}}
{{- printf "http://%s" (include "stream.fullname" .) -}}
{{- end -}}

{{- define "minio.url" -}}
  {{- if .Values.goaws.enabled -}}
    {{- printf "http://%s-minio" .Release.Name -}}
  {{- end -}}
{{- end -}}

{{- define "sqs.url" -}}
  {{- if .Values.goaws.enabled -}}
    {{- printf "http://%s" (include "goaws.fullname" .) -}}
  {{- end -}}
{{- end -}}

{{- define "sns.url" -}}
  {{- if .Values.goaws.enabled -}}
    {{- printf "http://%s" (include "goaws.fullname" .) -}}
  {{- end -}}
{{- end -}}


{{- define "pg.host" -}}
  {{- if .Values.postgresql.enabled -}}
    {{- printf "%s-postgresql" .Release.Name -}}
  {{- else -}}
    {{- .Values.comp.db.host -}}
  {{- end -}}
{{- end -}}

{{- define "pg.database" -}}
  {{- .Values.comp.db.name -}}
{{- end -}}

{{- define "pg.username" -}}
  {{- if .Values.postgresql.enabled -}}
    {{- .Values.postgresql.auth.username -}}
  {{- else -}}
    {{- .Values.comp.db.user -}}
  {{- end -}}
{{- end -}}

{{- define "pg.password" -}}
  {{- if .Values.postgresql.enabled -}}
    {{- .Values.postgresql.auth.postgresPassword | default "" -}}
  {{- else -}}
    {{- .Values.comp.db.password | default "" -}}
  {{- end -}}
{{- end -}}

{{- define "pg.port" -}}
  {{- if .Values.postgresql.enabled -}}
    {{- .Values.postgresql.service.port | default "5432" -}}
  {{- else -}}
    {{- .Values.comp.db.port | default "5432" -}}
  {{- end -}}
{{- end -}}

{{- define "pg.sslMode" -}}
  {{- if .Values.postgresql.enabled -}}
    {{- "disable" -}}
  {{- else -}}
    {{- .Values.comp.db.sslMode | default "allow" -}}
  {{- end -}}
{{- end -}}

{{- define "pg.b64ca" -}}
  {{- if and (not .Values.postgresql.enabled) .Values.comp.db.ca -}}
    {{- .Values.comp.db.ca | b64enc -}}
  {{- end -}}
{{- end -}}

{{- define "pg.encryptedPassword" -}}
  {{- include "pg.password" . | b64enc -}}
{{- end -}}


{{- define "redis.host" -}}
  {{- if .Values.redis.enabled -}}
    {{- printf "%s-redis-master" .Release.Name -}}
  {{- else -}}
    {{- .Values.comp.redis.host -}}
  {{- end -}}
{{- end -}}

{{- define "redis.db" -}}
  {{- .Values.comp.redis.db | default "0" -}}
{{- end -}}

{{- define "redis.username" -}}
  {{- if .Values.redis.enabled -}}
    {{- .Values.redis.username -}}
  {{- else -}}
    {{- .Values.comp.redis.username -}}
  {{- end -}}
{{- end -}}

{{- define "redis.password" -}}
  {{- if and .Values.redis.enabled .Values.redis.auth -}}
    {{- .Values.redis.auth.password | default "" -}}
  {{- else -}}
    {{- .Values.comp.redis.password | default "" -}}
  {{- end -}}
{{- end -}}

{{- define "redis.port" -}}
  {{- if .Values.redis.enabled -}}
    {{- .Values.redis.master.service.port | default "6379" -}}
  {{- else -}}
    {{- .Values.comp.redis.port | default "6379" -}}
  {{- end -}}
{{- end -}}

{{- define "redis.encryptedPassword" -}}
  {{- if (include "redis.password" .) -}}
    {{- include "redis.password" . | b64enc -}}
  {{- end -}}
{{- end -}}

{{- define "redis.url" -}}
{{- printf "%s:%s" (include "redis.host" .) (include "redis.port" .) -}}
{{- end -}}
