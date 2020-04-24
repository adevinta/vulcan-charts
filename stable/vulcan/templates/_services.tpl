{{/*
Override names
*/}}
{{- define "persistenceHost" -}}
{{- printf "%s-persistence" .Release.Name -}}
{{- end -}}

{{- define "vulcanApi" -}}
{{- printf "http://%s-api/api" .Release.Name -}}
{{- end -}}

{{- define "scanEngineUrl" -}}
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

{{- define "reportsGeneratorUrl" -}}
{{- printf "http://%s-reportsgenerator/" .Release.Name -}}
{{- end -}}

{{- define "metricsRedisAddr" -}}
{{- printf "%s-metrics-redis:6379" .Release.Name -}}
{{- end -}}

{{- define "metricsDogstatsdAddr" -}}
{{- printf "%s-metrics-dogstatsd:8125" .Release.Name -}}
{{- end -}}
