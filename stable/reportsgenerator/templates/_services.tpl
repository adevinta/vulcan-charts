{{/*
Define names that can be overriden in a parent chart
*/}}
{{- define "persistenceEndpoint" -}}
{{- printf "%s-persistence" .Release.Name -}}
{{- end -}}
