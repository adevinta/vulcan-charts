{{/*
Override names
*/}}
{{- define "proxy-annotations" -}}
prometheus.io/scrape: 'true'
prometheus.io/port: '9101'
{{- end -}}

{{- define "proxy-config-map" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    name: {{ .Release.Name }}-{{ .Chart.Name }}-proxy
  name: {{ .Release.Name }}-{{ .Chart.Name }}-proxy
data:
  haproxy.cfg: |
    global
      daemon
      maxconn 64
      log stdout format raw daemon

    defaults
      mode http
      timeout connect 5s
      timeout client 50s
      timeout server 50s

    {{- if .Values.proxy.cache }}
    cache small
      total-max-size 64     # mb
      max-age 240           # seconds
    {{- end }}

    frontend http
      bind *:{{ .Values.proxy.port | default 80 }}
      log global
      option httplog
    {{- if .Values.proxy.cache }}
      http-request cache-use small
      http-response cache-store small
    {{- end }}
      http-request capture req.hdr(Host) len 20
      http-request capture req.hdr(User-Agent) len 100
      default_backend app

    backend app
      server app 127.0.0.1:{{ .Values.containerPort }} maxconn 32

    frontend stats
      bind *:9101
      option http-use-htx
      http-request use-service prometheus-exporter if { path /metrics }
      monitor-uri {{ .Values.proxy.probePath | default "/healthz" }}
{{- end -}}

{{- define "proxy-container" -}}
- name: proxy
  image: haproxy:alpine
  ports:
    - name: http
      containerPort: {{ .Values.proxy.port | default "80" }}
    - name: metrics
      containerPort: 9101
  volumeMounts:
  - mountPath: /usr/local/etc/haproxy
    readOnly: true
    name: config-proxy
  livenessProbe:
    httpGet:
      path: {{ .Values.proxy.probePath | default "/healthz" }}
      port: metrics
    initialDelaySeconds: {{ .Values.proxy.probeInitialDelay | default 5 }}
  readinessProbe:
    httpGet:
      path: {{ .Values.proxy.probePath | default "/healthz" }}
      port: metrics
    initialDelaySeconds: {{ .Values.proxy.probeInitialDelay | default 5 }}
{{- end -}}

{{- define "proxy-volumes" -}}
volumes:
- name: config-proxy
  configMap:
    name: {{ .Release.Name }}-{{ .Chart.Name }}-proxy
{{- end -}}
