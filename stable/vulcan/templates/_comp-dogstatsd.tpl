{{- define "comp-dogstatsd-sidecar" -}}
{{- if .comp.dogstatsd -}}
{{- if .comp.dogstatsd.enabled -}}
{{- if eq ( .comp.dogstatsd.host | default "localhost") "localhost" }}
- name: dogstatsd
  image: "{{ .comp.dogstatsd.image.repository }}:{{ .comp.dogstatsd.image.tag }}"
  envFrom:
  - secretRef:
      name: "{{ template "vulcan.fullname" .context }}-dogstatsd"
  ports:
    - containerPort: 8125
      name: dogstatsd
      protocol: UDP
  resources:
    {{- toYaml .comp.dogstatsd.resources | nindent 12 }}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "comp-dogstatsd-envs" -}}
{{- if .comp.dogstatsd -}}
{{- if .comp.dogstatsd.enabled -}}
- name: DOGSTATSD_ENABLED
  value: "true"
- name: DOGSTATSD_HOST
  value: {{ .comp.dogstatsd.host | default "localhost" | quote }}
- name: DOGSTATSD_PORT
  value: {{ .comp.dogstatsd.port | default "8125" | quote }}
{{- end -}}
{{- end -}}
{{- end -}}
