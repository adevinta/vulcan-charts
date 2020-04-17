{{- define "infra-envs-s3" -}}
{{- if .Values.s3.internal }}
- name: AWS_S3_ENDPOINT
  value: "{{ tpl .Values.s3.internalEndpointTpl . }}"
- name: PATH_STYLE
  value: "true"
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
{{- end }}
{{- end -}}

{{- define "infra-envs-sqs" -}}
{{- if .Values.sqs.internal }}
- name: AWS_SQS_ENDPOINT
  value: "{{ tpl .Values.sqs.internalEndpointTpl . }}"
{{- end }}
{{- end -}}
