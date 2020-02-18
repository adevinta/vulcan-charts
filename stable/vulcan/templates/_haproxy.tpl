{{/*
Override names
*/}}
{{- define "proxy-annotations" -}}
prometheus.io/scrape: 'true'
prometheus.io/port: '{{ .Values.proxy.port | default 80 }}'
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
        log global
        option httplog
        timeout connect 5s
        timeout client 50s
        timeout server 50s

    listen http-in
        bind *:{{ .Values.proxy.port | default 80 }}
        http-request set-log-level silent if { path /metrics }
        http-request use-service prometheus-exporter if { path /metrics }
        server app 127.0.0.1:{{ .Values.containerPort }} maxconn 32
        monitor-uri {{ .Values.proxy.probePath | default "/proxyhealthz" }}
{{- end -}}

{{- define "proxy-container" -}}
- name: proxy
  image: haproxy:alpine
  ports:
    - name: http
      containerPort: {{ .Values.proxy.port | default "80" }}
  volumeMounts:
  - mountPath: /usr/local/etc/haproxy
    readOnly: true
    name: config-proxy
  livenessProbe:
    httpGet:
      path: {{ .Values.proxy.probePath | default "/proxyhealthz" }}
      port: http
    initialDelaySeconds: {{ .Values.proxy.probeInitialDelay | default 5 }}
  readinessProbe:
    httpGet:
      path: {{ .Values.proxy.probePath | default "/proxyhealthz" }}
      port: http
    initialDelaySeconds: {{ .Values.proxy.probeInitialDelay | default 5 }}
{{- end -}}

{{- define "proxy-volumes" -}}
volumes:
- name: config-proxy
  configMap:
    name: {{ .Release.Name }}-{{ .Chart.Name }}-proxy
{{- end -}}
