{{/*
Override names
*/}}
{{- define "comp-proxy-annotations" -}}
{{- if.comp.proxy.enabled -}}
checksum/config-proxy: {{ include "comp-proxy-config-map" . | sha256sum }}
prometheus.io/scrape: 'true'
prometheus.io/port: '{{ .comp.proxy.metricsPort | default 9101 }}'
{{- end -}}
{{- end -}}

{{- define "comp-proxy-config-map" -}}
{{- if .comp.proxy.enabled -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "vulcan.fullname" .context }}-{{ .comp.name }}-proxy
  labels: {{- include "vulcan.labels" .context | nindent 4 }}
    app.kubernetes.io/name: {{ .comp.name }}-proxy
data:
  haproxy.cfg: |
    global
      daemon
      maxconn {{.comp.proxy.maxconn | default 64 }}
      log stdout format raw daemon

    defaults
      mode http
      timeout connect {{.comp.proxy.timeoutConnect | default "5s" }}
      timeout client {{.comp.proxy.timeoutClient | default "25s" }}
      timeout server {{.comp.proxy.timeoutServer | default "25s" }}
      timeout tunnel {{.comp.proxy.timeoutTunnel | default "3600s" }}
      option  http-server-close

    {{- if.comp.proxy.cache.enabled }}
    cache small
      total-max-size {{.comp.proxy.cache.maxSize | default 64 }}     # mb
      max-age {{.comp.proxy.cache.maxAge | default 240 }}           # seconds
    {{- end }}

    frontend http
      bind *:{{.comp.proxy.port | default 80 }}
      log global
      option httplog clf
    {{- if.comp.proxy.cache.enabled }}
      http-request cache-use small
      http-response cache-store small
    {{- end }}
      http-request capture req.hdr(Host) len 50
      http-request capture req.hdr(User-Agent) len 100

    {{- if.comp.proxy.logFormat }}
      log-format "{{.comp.proxy.logFormat }}"
    {{- end }}

      default_backend app

    backend app
      server app 127.0.0.1:{{.comp.containerPort }}

    frontend stats
      bind *:{{.comp.proxy.metricsPort | default 9101 }}
      option http-use-htx
      http-request use-service prometheus-exporter if { path /metrics }
      monitor-uri {{.comp.proxy.probePath | default "/healthz" }}
{{- end -}}
{{- end -}}

{{- define "comp-proxy-container" -}}
{{- if .comp.proxy.enabled }}
- name: proxy
  image: "{{.comp.proxy.image.repository }}:{{.comp.proxy.image.tag }}"
  imagePullPolicy: Always
  ports:
    - name: http
      containerPort: {{.comp.proxy.port | default "80" }}
    - name: metrics
      containerPort: {{.comp.proxy.metricsPort | default 9101 }}
  volumeMounts:
  - mountPath: /usr/local/etc/haproxy
    readOnly: true
    name: config-proxy
  {{- if.comp.proxy.lifecycle.preStopSleep }}
  lifecycle:
    preStop:
      exec:
        command: ["/bin/sh","-c","sleep {{.comp.proxy.lifecycle.preStopSleep }};"]
  {{- end }}
  {{- if.comp.proxy.probe }}
  livenessProbe:
    httpGet:
      path: {{.comp.proxy.probePath | default "/healthz" }}
      port: metrics
    initialDelaySeconds: {{.comp.proxy.probeInitialDelay | default 5 }}
    timeoutSeconds: {{.comp.proxy.probeTimeoutSeconds | default 3 }}
  readinessProbe:
    httpGet:
      path: {{.comp.proxy.probePath | default "/healthz" }}
      port: metrics
    initialDelaySeconds: {{.comp.proxy.probeInitialDelay | default 5 }}
    timeoutSeconds: {{.comp.proxy.probeTimeoutSeconds | default 3 }}
  {{- end }}
  resources:
    {{- toYaml .comp.proxy.resources | nindent 4 }}
{{- end -}}
{{- end -}}

{{- define "comp-proxy-volumes" -}}
{{- if.comp.proxy.enabled -}}
- name: config-proxy
  configMap:
    name: {{ include "vulcan.fullname" .context }}-{{ .comp.name }}-proxy
{{- end -}}
{{- end -}}
