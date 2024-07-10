{{- define "common-manifests" -}}
{{- include "common-proxy-config-map" . }}
{{- include "common-serviceaccount" . }}
{{- end -}}


{{- define "common-serviceaccount" -}}
{{- if .Values.comp.serviceAccount.create}}
---
apiVersion: v1
kind: ServiceAccount
automountServiceAccountToken: {{ .Values.comp.serviceAccount.automountServiceAccountToken }}
metadata:
  name: {{ template "vulcan.fullname" . }}-{{ .Values.comp.name }}
  labels: {{- include "vulcan.labels" . | nindent 4 }}
    app.kubernetes.io/name: {{ .Values.comp.name }}
  {{- if .Values.comp.serviceAccount.annotations }}
  annotations:
    {{- toYaml .Values.comp.serviceAccount.annotations | nindent 4 }}
  {{- end }}
{{- end }}
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
imagePullPolicy: {{ .Values.comp.image.pullPolicy }}
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
{{- if .Values.comp.serviceAccount.create }}
serviceAccountName: {{ template "vulcan.fullname" . }}-{{ .Values.comp.name }}
{{- end }}
automountServiceAccountToken: {{ .Values.comp.automountServiceAccountToken }}
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
{{- if .Values.comp.extraVolumes }}
{{- $value := typeIs "string" .Values.comp.extraVolumes | ternary .Values.comp.extraVolumes (.Values.comp.extraVolumes | toYaml) }}
{{- tpl $value . }}
{{- end }}
{{ include "common-proxy-volumes" . }}
{{- end -}}

{{- define "common-deployment-volumeMounts" -}}
{{- if .Values.comp.extraVolumeMounts }}
{{- $value := typeIs "string" .Values.comp.extraVolumeMounts | ternary .Values.comp.extraVolumeMounts (.Values.comp.extraVolumeMounts | toYaml) }}
{{- tpl $value . }}
{{- end }}
{{- end -}}

{{- define "common-appPortName" -}}
{{- if .Values.comp.proxy -}}
{{- ternary "app" "http" .Values.comp.proxy.enabled -}}
{{- else -}}
http
{{- end -}}
{{- end -}}
