{{- define "comp-infra-envs" -}}
{{- $auth := 0 -}}
{{- if .comp.infra -}}
{{- if and  .comp.infra.sns .context.Values.goaws.enabled -}}
- name: AWS_SNS_ENDPOINT
  value: "{{ include "snsEndpoint" .context }}"
{{- $auth = 1 -}}
{{- end -}}
{{- if and .comp.infra.sqs .context.Values.goaws.enabled }}
- name: AWS_SQS_ENDPOINT
  value: "{{ include "sqsEndpoint" .context }}"
{{- $auth = 1 -}}
{{- end -}}
{{- if and .comp.infra.s3 .context.Values.minio.enabled }}
- name: AWS_S3_ENDPOINT
  value: "{{ include "minioEndpoint" .context }}"
- name: PATH_STYLE
  value: "true"
- name: AWS_S3_REGION
  value: "{{ .context.Values.global.region }}"
- name: AWS_ACCESS_KEY_ID
  valueFrom:
    secretKeyRef:
      name: "{{ printf "%s-minio" .context.Release.Name }}"
      key: access-key
- name: AWS_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: "{{ printf "%s-minio" .context.Release.Name }}"
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
