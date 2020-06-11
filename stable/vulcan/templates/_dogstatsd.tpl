{{- define "dogstatsd-sidecar" -}}
{{- if .Values.dogstatsd.enabled -}}
{{- if eq ( .Values.dogstatsd.host | default "localhost") "localhost" }}
- name: dogstatsd
  image: {{ .Values.dogstatsd.image | default "datadog/dogstatsd:7.19.2" }}
  envFrom:
  - secretRef:
      name: {{ .Release.Name }}-dogstatsd
  ports:
    - containerPort: 8125
      name: dogstatsd
      protocol: UDP
  resources:
    {{- toYaml .Values.dogstatsd.resources | nindent 12 }}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "dogstatsd-envs" -}}
{{- if .Values.dogstatsd.enabled -}}
- name: DOGSTATSD_ENABLED
  value: "true"
- name: DOGSTATSD_HOST
  value: "{{ .Values.dogstatsd.host | default "localhost" }}"
- name: DOGSTATSD_PORT
  value: "{{ .Values.dogstatsd.port | default "8125" }}"
{{- end -}}
{{- end -}}
