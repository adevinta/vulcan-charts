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

{{- define "defaultBackendHost" -}}
{{- printf "%s-ui-db" .Release.Name -}}
{{- end -}}

{{- define "metricsRedisAddr" -}}
{{- printf "%s-metrics-redis:6379" .Release.Name -}}
{{- end -}}

{{- define "metricsDogstatsdAddr" -}}
{{- printf "%s-metrics-dogstatsd:8125" .Release.Name -}}
{{- end -}}

{{- define "minioEndpoint" -}}
{{- printf "http://%s-minio" .Release.Name -}}
{{- end -}}

{{- define "sqsEndpoint" -}}
{{- printf "http://%s-aws" .Release.Name -}}
{{- end -}}

{{- define "snsEndpoint" -}}
{{- printf "http://%s-aws" .Release.Name -}}
{{- end -}}

{{- define "api.hostname" -}}
{{ printf "%s.%s" "www" .Values.global.domain }}
{{- end -}}

{{- define "aws.hostname" -}}
{{ printf "%s.%s" "aws" .Values.global.domain }}
{{- end -}}

{{- define "crontinuous.hostname" -}}
{{ printf "%s.%s" "crontinuous" .Values.global.domain}}
{{- end -}}

{{- define "insights.hostname" -}}
{{ printf "%s.%s" "insights" .Values.global.domain }}
{{- end -}}

{{- define "persistence.hostname" -}}
{{ printf "%s.%s" "persistence" .Values.global.domain }}
{{- end -}}

{{- define "results.hostname" -}}
{{ printf "%s.%s" "results" .Values.global.domain }}
{{- end -}}

{{- define "scanengine.hostname" -}}
{{ printf "%s.%s" "scanengine" .Values.global.domain }}
{{- end -}}

{{- define "stream.hostname" -}}
{{ printf "%s.%s" "stream" .Values.global.domain }}
{{- end -}}

{{- define "ui.hostname" -}}
{{ printf "%s.%s" "www" .Values.global.domain }}
{{- end -}}

{{- define "postgresqlHost" -}}
{{  .Values.db.host | default (printf "%s-postgresql" .Release.Name ) }}
{{- end -}}
