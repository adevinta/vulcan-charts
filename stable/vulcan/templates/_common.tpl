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
