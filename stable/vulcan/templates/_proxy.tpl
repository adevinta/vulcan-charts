{{/*
Override names
*/}}
{{- define "common-proxy-annotations" -}}
{{- if .Values.comp.proxy.enabled -}}
checksum/config-proxy: {{ include "common-proxy-config-map" . | sha256sum }}
prometheus.io/scrape: 'true'
prometheus.io/port: '{{ .Values.comp.proxy.metricsPort | default 9101 }}'
{{- end -}}
{{- end -}}

{{- define "common-proxy-config-map" -}}
{{- if .Values.comp.proxy.enabled -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "vulcan.fullname" . }}-{{ .Values.comp.name }}-proxy
  labels: {{- include "vulcan.labels" . | nindent 4 }}
    app.kubernetes.io/name: {{ .Values.comp.name }}-proxy
data:
  haproxy.cfg: |
    global
      daemon
      maxconn {{ .Values.comp.proxy.maxconn | default 64 }}
      log stdout format raw daemon

    defaults
      mode http
      timeout connect {{ .Values.comp.proxy.timeoutConnect | default "5s" }}
      timeout client {{ .Values.comp.proxy.timeoutClient | default "25s" }}
      timeout server {{ .Values.comp.proxy.timeoutServer | default "25s" }}
      timeout tunnel {{ .Values.comp.proxy.timeoutTunnel | default "3600s" }}
      option  http-server-close

    {{- if .Values.comp.proxy.cache.enabled }}
    cache small
      total-max-size {{ .Values.comp.proxy.cache.maxSize | default 64 }}     # mb
      max-age {{ .Values.comp.proxy.cache.maxAge | default 240 }}           # seconds
    {{- end }}

    frontend http
      bind *:{{ .Values.comp.proxy.port | default 80 }}
      log global
      option httplog clf
    {{- if .Values.comp.proxy.cache.enabled }}
      http-request cache-use small
      http-response cache-store small
    {{- end }}
      http-request capture req.hdr(Host) len 50
      http-request capture req.hdr(User-Agent) len 100

    {{- if .Values.comp.proxy.logFormat }}
      log-format "{{ .Values.comp.proxy.logFormat }}"
    {{- end }}

      default_backend app

    backend app
      server app 127.0.0.1:{{ .Values.comp.containerPort }}

    frontend stats
      bind *:{{ .Values.comp.proxy.metricsPort | default 9101 }}
      option http-use-htx
      http-request use-service prometheus-exporter if { path /metrics }
      monitor-uri {{ .Values.comp.proxy.probePath | default "/healthz" }}
{{- end -}}
{{- end -}}

{{- define "common-proxy-sidecar" -}}
{{- if .Values.comp.proxy.enabled }}
- name: proxy
  image: "{{ .Values.comp.proxy.image.repository }}:{{ .Values.comp.proxy.image.tag }}"
  imagePullPolicy: Always
  ports:
    - name: http
      containerPort: {{ .Values.comp.proxy.port | default "80" }}
    - name: metrics
      containerPort: {{ .Values.comp.proxy.metricsPort | default 9101 }}
  volumeMounts:
  - mountPath: /usr/local/etc/haproxy
    readOnly: true
    name: config-proxy
  {{- if .Values.comp.proxy.lifecycle.preStopSleep }}
  lifecycle:
    preStop:
      exec:
        command: ["/bin/sh","-c","sleep {{ .Values.comp.proxy.lifecycle.preStopSleep }};"]
  {{- end }}
  {{- if .Values.comp.proxy.probe }}
  livenessProbe:
    httpGet:
      path: {{ .Values.comp.proxy.probePath | default "/healthz" }}
      port: metrics
    initialDelaySeconds: {{ .Values.comp.proxy.probeInitialDelay | default 5 }}
    timeoutSeconds: {{ .Values.comp.proxy.probeTimeoutSeconds | default 3 }}
  readinessProbe:
    httpGet:
      path: {{ .Values.comp.proxy.probePath | default "/healthz" }}
      port: metrics
    initialDelaySeconds: {{ .Values.comp.proxy.probeInitialDelay | default 5 }}
    timeoutSeconds: {{ .Values.comp.proxy.probeTimeoutSeconds | default 3 }}
  {{- end }}
  {{- with .Values.comp.proxy.resources }}
  resources:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end -}}
{{- end -}}

{{- define "common-proxy-volumes" -}}
{{- if .Values.comp.proxy.enabled -}}
- name: config-proxy
  configMap:
    name: {{ include "vulcan.fullname" . }}-{{ .Values.comp.name }}-proxy
{{- end -}}
{{- end -}}
