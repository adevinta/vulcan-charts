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

{{/*
Create the name of the service account to use
*/}}
{{- define "vulcan.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "vulcan.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "api.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.api.name -}}
{{- end -}}

{{- define "crontinuous.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.crontinuous.name -}}
{{- end -}}

{{- define "goaws.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.goaws.name -}}
{{- end -}}

{{- define "insights.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.insights.name -}}
{{- end -}}

{{- define "metrics.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.metrics.name -}}
{{- end -}}

{{- define "persistence.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.persistence.name -}}
{{- end -}}

{{- define "redis.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.redis.name -}}
{{- end -}}

{{- define "reportsgenerator.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.reportsgenerator.name -}}
{{- end -}}

{{- define "results.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.results.name -}}
{{- end -}}

{{- define "scanengine.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.scanengine.name -}}
{{- end -}}

{{- define "stream.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.stream.name -}}
{{- end -}}

{{- define "ui.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.ui.name -}}
{{- end -}}

{{- define "vulndb.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.vulndb.name -}}
{{- end -}}

{{- define "vulndbapi.name" -}}
{{- printf "%s-%s" (include "vulcan.fullname" .) .Values.vulndbapi.name -}}
{{- end -}}