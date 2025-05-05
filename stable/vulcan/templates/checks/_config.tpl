{{- define "checks-config" -}}
checktypes.json: |-
  {{- $l := dict -}}
  {{- range $key, $v := .Values.checks.checks -}}
  {{- $_ := set $l $key (
    dict 
      "name" $key
      "timeout" $v.timeout 
      "options" (ternary nil (ternary $v.options (toJson $v.options) (kindIs "string" $v.options)) (empty $v.options))
      "required_vars" $v.vars 
      "image" (printf "%s:%s" $v.image.repository $v.image.tag)
      "assets" $v.assets
    )
  -}}
  {{- end -}}
  {{ toPrettyJson $l | nindent 2 }}
{{- end -}}
