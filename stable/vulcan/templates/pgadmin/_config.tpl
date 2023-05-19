{{- define "pgadmin-secrets" -}}
PGADMIN_DEFAULT_EMAIL: {{ .Values.comp.conf.email | b64enc | quote }}
PGADMIN_DEFAULT_PASSWORD: {{ .Values.comp.conf.password | b64enc | quote }}
{{- end -}}
{{- define "pgadmin-servers" -}}
servers.json: |
    {
        "Servers": {
        {{- if .Values.postgresql.enabled }}
            "1": {
                "Name": "vulcan",
                "Group": "Servers",
                "Port": {{ .Values.postgresql.service.port }},
                "Username": "{{ .Values.postgresql.auth.username }}",
                "Host": "{{ include "pg.host" .}}",
                "SSLMode": "prefer",
                "MaintenanceDB": "{{ .Values.postgresql.auth.database }}"
            }
        {{- else }}
            "1": {
                "Name": "{{ .Values.persistence.name }}",
                "Group": "Servers",
                "Port": {{ .Values.persistence.db.port }},
                "Username": "{{ .Values.persistence.db.username }}",
                "Host": "{{ .Values.persistence.db.host }}",
                "SSLMode": "prefer",
                "MaintenanceDB": "{{ .Values.persistence.db.name }}"
            },
            "2": {
                "Name": "{{ .Values.api.name }}",
                "Group": "Servers",
                "Port": {{ .Values.api.db.port }},
                "Username": "{{ .Values.api.db.username }}",
                "Host": "{{ .Values.api.db.host }}",
                "SSLMode": "prefer",
                "MaintenanceDB": "{{ .Values.api.db.name }}"
            },
            "3": {
                "Name": "{{ .Values.scanengine.name }}",
                "Group": "Servers",
                "Port": {{ .Values.scanengine.db.port }},
                "Username": "{{ .Values.scanengine.db.username  }}",
                "Host": "{{ .Values.scanengine.db.host }}",
                "SSLMode": "prefer",
                "MaintenanceDB": "{{ .Values.scanengine.db.name }}"
            },
            "4": {
                "Name": "{{ .Values.vulndb.name }}",
                "Group": "Servers",
                "Port": {{ .Values.vulndb.db.port }},
                "Username": "{{ .Values.vulndb.db.username }}",
                "Host": "{{ .Values.vulndb.db.host }}",
                "SSLMode": "prefer",
                "MaintenanceDB": "{{ .Values.vulndb.db.name }}"
            },
            "5": {
                "Name": "{{ .Values.reportsgenerator.name }}",
                "Group": "Servers",
                "Port": {{ .Values.reportsgenerator.db.port }},
                "Username": "{{ .Values.reportsgenerator.db.username }}",
                "Host": "{{ .Values.reportsgenerator.db.host }}",
                "SSLMode": "prefer",
                "MaintenanceDB": "{{ .Values.reportsgenerator.db.name }}"
            }
        {{- end }}
        }
    }
{{- end -}}
