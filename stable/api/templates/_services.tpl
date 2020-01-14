{{/*
Define names that can be overriden in a parent chart
*/}}
{{- define "scanEngineUrl" -}}
{{- printf "http://%s-scanengine/v1/" .Release.Name -}}
{{- end -}}

{{- define "crontinuousUrl" -}}
{{- printf "http://%s-crontinuous/" .Release.Name -}}
{{- end -}}

{{- define "persistenceHost" -}}
{{- printf "%s-persistence" .Release.Name -}}
{{- end -}}

{{- define "persistenceEndpoint" -}}
{{- printf "http://%s-persistence" .Release.Name -}}
{{- end -}}

{{- define "resultsEndpoint" -}}
{{- printf "http://%s-results" .Release.Name -}}
{{- end -}}
