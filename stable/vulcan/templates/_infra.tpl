{{- define "common-infra-envs" -}}
{{- $auth := 0 -}}
{{- if .Values.comp.meta -}}
{{- if and  .Values.comp.meta.sns .Values.goaws.enabled -}}
- name: AWS_SNS_ENDPOINT
  value: {{ include "sns.url" . | quote }}
{{- $auth = 1 -}}
{{- end -}}
{{- if and .Values.comp.meta.sqs .Values.goaws.enabled }}
- name: AWS_SQS_ENDPOINT
  value: {{ include "sqs.url" . | quote }}
{{- $auth = 1 -}}
{{- end -}}
{{- if and .Values.comp.meta.s3 .Values.minio.enabled }}
- name: AWS_S3_ENDPOINT
  value: {{ include "minio.url" . | quote }}
- name: PATH_STYLE
  value: "true"
- name: AWS_S3_REGION
  value: {{ .Values.global.region | quote }}
- name: AWS_ACCESS_KEY_ID
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-minio" .Release.Name }}
      key: root-user
- name: AWS_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-minio" .Release.Name }}
      key: root-password
{{- $auth = 0 -}}
{{- end }}
{{- if eq $auth 1 }}
- name: AWS_ACCESS_KEY_ID
  value: ANYVALUE
- name: AWS_SECRET_ACCESS_KEY
  value: ANYVALUE
{{- end -}}
{{- end -}}
{{- end -}}
