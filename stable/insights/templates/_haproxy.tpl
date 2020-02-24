{{- define "insights.proxy-config-map" -}}
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

    frontend http
      bind *:{{ .Values.containerPort }}
      log global
      option httplog
      http-request capture req.hdr(Host) len 20
      http-request capture req.hdr(User-Agent) len 100
      {{- range .Values.conf.proxies }}
      {{- if .prefix }}
      use_backend {{ .name }} if { path -i -m beg {{ .prefix}} }
      {{- else }}
      default_backend {{ .name }}
      {{- end }}
      {{- end }}

    {{- $dot := . }}
    {{- range .Values.conf.proxies }}
    backend {{ .name }}
      server app 127.0.0.1:{{ .port }} maxconn 32
    {{- end }}

    frontend stats
      bind *:9101
      option http-use-htx
      http-request use-service prometheus-exporter if { path /metrics }
      monitor-uri {{ .Values.proxy.probePath | default "/proxyhealthz" }}
{{- end -}}
