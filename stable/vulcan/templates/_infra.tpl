{{- define "infra-envs-s3" -}}
{{- if .Values.global.s3.enabled }}
- name: AWS_S3_ENDPOINT
  value: "{{ include "s3Endpoint" . }}"
- name: PATH_STYLE
  value: "true"
- name: AWS_S3_REGION
  value: "{{ .Values.global.region }}"
- name: AWS_ACCESS_KEY_ID
  valueFrom:
    secretKeyRef:
      name: "{{ printf "%s-s3" .Release.Name }}"
      key: access-key
- name: AWS_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: "{{ printf "%s-s3" .Release.Name }}"
      key: secret-key
{{- end }}
{{- end -}}

{{- define "infra-envs-sns" -}}
{{- if .Values.global.sns.enabled }}
- name: AWS_SNS_ENDPOINT
  value: "{{ include "snsEndpoint" . }}"
- name: AWS_SNS_REGION
  value: "{{ .Values.global.region }}"
{{- end }}
{{- end -}}

{{- define "infra-envs-sqs" -}}
{{- if .Values.global.sqs.enabled }}
- name: AWS_SQS_ENDPOINT
  value: "{{ include "sqsEndpoint" . }}"
- name: AWS_SQS_REGION
  value: "{{ .Values.global.region }}"
{{- end }}
{{- end -}}
