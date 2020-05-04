{{- define "infra-envs-s3" -}}
{{- if .Values.s3.internal }}
- name: AWS_S3_ENDPOINT
  value: "{{ tpl .Values.s3.internalEndpointTpl . }}"
- name: PATH_STYLE
  value: "true"
- name: AWS_S3_REGION
  value: "{{ .Values.s3.region | default .Values.global.region }}"
{{- if or .Values.s3.existingSecretTpl }}
- name: AWS_ACCESS_KEY_ID
  valueFrom:
    secretKeyRef:
      name: "{{ tpl .Values.s3.existingSecretTpl . }}"
      key: access-key
- name: AWS_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: "{{ tpl .Values.s3.existingSecretTpl . }}"
      key: secret-key
{{- end }}
{{- end }}
{{- end -}}

{{- define "infra-envs-sns" -}}
{{- if .Values.sns.internal }}
- name: AWS_SNS_ENDPOINT
  value: "{{ tpl .Values.sns.internalEndpointTpl . }}"
- name: AWS_SNS_REGION
  value: "{{ .Values.sns.region | default .Values.global.region }}"
{{- end }}
{{- end -}}

{{- define "infra-envs-sqs" -}}
{{- if .Values.sqs.internal }}
- name: AWS_SQS_ENDPOINT
  value: "{{ tpl .Values.sqs.internalEndpointTpl . }}"
- name: AWS_SQS_REGION
  value: "{{ .Values.sqs.region | default .Values.global.region }}"
{{- end }}
{{- end -}}
