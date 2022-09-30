{{- define "tracker-secrets" -}}
PG_PASSWORD: {{ include "pg.encryptedPassword" . | quote }}
{{- range $index, $value := .Values.comp.conf.trackers.jira }}
JIRA_PASSWORD_{{ add1 $index }}: {{ $value.password | b64enc | quote }}
{{- end }}
