{{/*
Override names
*/}}
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
