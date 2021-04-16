{{- define "comp-infra-envs" -}}
{{- $auth := 0 -}}
{{- if .Values.comp.infra -}}
{{- if and  .Values.comp.infra.sns .Values.goaws.enabled -}}
- name: AWS_SNS_ENDPOINT
  value: {{ include "sns.url" . | quote }}
{{- $auth = 1 -}}
{{- end -}}
{{- if and .Values.comp.infra.sqs .Values.goaws.enabled }}
- name: AWS_SQS_ENDPOINT
  value: {{ include "sqs.url" . | quote }}
{{- $auth = 1 -}}
{{- end -}}
{{- if and .Values.comp.infra.s3 .Values.minio.enabled }}
- name: AWS_S3_ENDPOINT
  value: {{ include "minio.url" . | quote }}
- name: PATH_STYLE
  value: "true"
- name: AWS_S3_REGION
  value: {{ .Values.global.region | quote }}
- name: AWS_ACCESS_KEY_ID
  valueFrom:
    secretKeyRef:
      name: "{{ printf "%s-minio" .Release.Name }}"
      key: access-key
- name: AWS_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: "{{ printf "%s-minio" .Release.Name }}"
      key: secret-key
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
