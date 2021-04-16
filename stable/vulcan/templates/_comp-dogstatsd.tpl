{{- define "comp-dogstatsd-sidecar" -}}
{{- if .Values.comp.dogstatsd -}}
{{- if .Values.comp.dogstatsd.enabled -}}
{{- if eq ( .Values.comp.dogstatsd.host | default "localhost") "localhost" }}
- name: dogstatsd
  image: "{{ .Values.comp.dogstatsd.image.repository }}:{{ .Values.comp.dogstatsd.image.tag }}"
  envFrom:
  - secretRef:
      name: "{{ template "vulcan.fullname" . }}-dogstatsd"
  ports:
    - containerPort: 8125
      name: dogstatsd
      protocol: UDP
  {{- with .Values.comp.dogstatsd.resources }}
  resources:
    {{- toYaml . | nindent 12 }}
  {{- end }}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "comp-dogstatsd-envs" -}}
{{- if .Values.comp.dogstatsd -}}
{{- if .Values.comp.dogstatsd.enabled -}}
- name: DOGSTATSD_ENABLED
  value: "true"
- name: DOGSTATSD_HOST
  value: {{ .Values.comp.dogstatsd.host | default "localhost" | quote }}
- name: DOGSTATSD_PORT
  value: {{ .Values.comp.dogstatsd.port | default "8125" | quote }}
{{- end -}}
{{- end -}}
{{- end -}}
