{{- define "common-manifests" -}}
{{- include "common-proxy-config-map" . }}
{{- end -}}

{{- define "common-annotations" -}}
{{- include "common-proxy-annotations" . }}
{{- with .Values.comp.annotations }}
{{ toYaml . }}
{{- end -}}

{{- end -}}

{{/*
Lifecycle common preStop
*/}}
{{- define "common-container" -}}
{{- with .Values.comp.securityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}
image: "{{ .Values.comp.image.repository }}:{{ .Values.comp.image.tag }}"
{{- with .Values.comp.image.pullPolicy }}
imagePullPolicy: {{ . }}
{{- end -}}
{{- with .Values.comp.lifecycle }}
{{- if or .preStopCommand .preStopSleep }}
lifecycle:
  preStop:
    exec:
  {{- if .preStopCommand }}
      command: {{ .preStopCommand }}
  {{- else }}
      command: ["/bin/sh","-c","sleep {{ .preStopSleep }};"]
  {{- end }}
{{- end -}}
{{- end -}}
{{- if .Values.comp.livenessProbe -}}
{{- if and .Values.comp.livenessProbe.enabled (or .Values.comp.livenessProbe.command ( .Values.comp.livenessProbe.path | default .Values.comp.healthcheckPath )) }}
livenessProbe:
  {{- if .Values.comp.livenessProbe.command }}
  exec:
    command: {{ .Values.comp.livenessProbe.command | default .Values.comp.healthcheckPath }}
  {{- else }}
  httpGet:
    path: {{ .Values.comp.livenessProbe.path | default .Values.comp.healthcheckPath }}
    port: {{ .Values.comp.containerPort }}
  {{- end }}
  initialDelaySeconds: {{ .Values.comp.livenessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.comp.livenessProbe.periodSeconds }}
  timeoutSeconds: {{ .Values.comp.livenessProbe.timeoutSeconds }}
  successThreshold: {{ .Values.comp.livenessProbe.successThreshold }}
  failureThreshold: {{ .Values.comp.livenessProbe.failureThreshold }}
{{- end }}
{{- end }}
{{- if .Values.comp.readinessProbe -}}
{{- if and .Values.comp.readinessProbe.enabled (or .Values.comp.readinessProbe.command ( .Values.comp.readinessProbe.path | default .Values.comp.healthcheckPath )) }}
readinessProbe:
  {{- if .Values.comp.readinessProbe.command }}
  exec:
    command: {{ .Values.comp.readinessProbe.command }}
  {{- else }}
  httpGet:
    path: {{ .Values.comp.readinessProbe.path | default .Values.comp.healthcheckPath }}
    port: {{ .Values.comp.containerPort }}
  {{- end }}
  initialDelaySeconds: {{ .Values.comp.readinessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.comp.readinessProbe.periodSeconds }}
  timeoutSeconds: {{ .Values.comp.readinessProbe.timeoutSeconds }}
  successThreshold: {{ .Values.comp.readinessProbe.successThreshold }}
  failureThreshold: {{ .Values.comp.readinessProbe.failureThreshold }}
{{- end -}}
{{- end -}}
{{- with .Values.comp.resources }}
resources:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}


{{- define "common-deployment-spec" -}}
{{- with .Values.comp.terminationGracePeriodSeconds }}
terminationGracePeriodSeconds: {{ . }}
{{- end -}}
{{- with .Values.comp.imagePullSecrets }}
imagePullSecrets:
{{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.comp.podSecurityContext }}
securityContext:
{{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.comp.nodeSelector }}
nodeSelector:
{{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.comp.affinity }}
affinity:
{{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.comp.tolerations }}
tolerations:
{{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}


{{- define "common-deployment-sidecars" -}}
{{- include "common-dogstatsd-sidecar" . }}
{{- include "common-proxy-sidecar" . }}
{{- end -}}

{{- define "common-container-envs" -}}
{{ include "common-infra-envs" . }}
{{ include "common-dogstatsd-envs" . }}
{{- range $name, $value := .Values.comp.extraEnv }}
- name: {{ $name }}
  value: {{ $value | quote }}
{{- end }}
{{- end -}}

{{- define "common-deployment-volumes" -}}
{{- include "common-proxy-volumes" . }}
{{- end -}}

{{- define "common-appPortName" -}}
{{- if .Values.comp.proxy -}}
{{- ternary "app" "http" .Values.comp.proxy.enabled -}}
{{- else -}}
http
{{- end -}}
{{- end -}}


{{- define "common-deployment-init-waitfordb" -}}
- name: waitfordb
  image: "{{ .Values.waitfordb.image.repository }}:{{ .Values.waitfordb.image.tag }}"
  imagePullPolicy: Always
  command: ['sh', '-c', 'until nc -z "$PGHOST" "$PGPORT"; do echo WaitingDB && sleep 5; done;']
  env:
  - name: PGHOST
    value: {{ include "pg.host" . | quote }}
  - name: PGPORT
    value: {{ include "pg.port" . | quote }}
{{- end -}}
