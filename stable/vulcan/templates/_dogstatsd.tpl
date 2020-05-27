{{- define "dogstatsd-sidecar" -}}
{{- if .Values.dogstatsd.enabled -}}
- name: dogstatsd
  image: datadog/docker-dd-agent:latest-dogstatsd
  envFrom:
  - secretRef:
      name: {{ .Release.Name }}-dogstatsd
  ports:
    - containerPort: 8125
      name: dogstatsd
      protocol: UDP

{{- end -}}
{{- end -}}
