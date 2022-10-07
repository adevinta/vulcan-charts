# vulcan

![Version: 0.5.1](https://img.shields.io/badge/Version-0.5.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A Helm chart for deploying Vulcan

**Homepage:** <https://github.com/adevinta/vulcan-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Adevinta | <vulcan@adevinta.com> |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | minio | 11.x.x |
| https://charts.bitnami.com/bitnami | postgresql | 11.x.x |
| https://charts.bitnami.com/bitnami | redis | 17.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.domain | string | `"vulcan.local"` |  |
| global.region | string | `"local"` |  |
| global.podLabels | object | `{}` | custom labels for all components |
| anchors | object | `{"comp":{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null},"containerPort":8080,"extraEnv":{},"extraPodLabels":{},"fullnameOverride":"","image":{"pullPolicy":"Always"},"imagePullSecrets":[],"ingress":{"annotations":{},"enabled":false,"hosts":[],"tls":[]},"lifecycle":{"preStopSleep":30},"livenessProbe":{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3},"nameOverride":"","nodeSelector":{},"podSecurityContext":{},"proxy":{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null},"readinessProbe":{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3},"replicaCount":null,"resources":{},"securityContext":{},"service":{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"},"tolerations":[]},"db":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"dogstatsd":{"enabled":true,"image":{"repository":"datadog/dogstatsd","tag":"7.39.1"}}}` | Anchors |
| anchors.db | object | `{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null}` | postgres database settings |
| scanengine.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| api.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| metrics.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| results.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| reportsgenerator.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| stream.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| persistence.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| metrics.dogstatsd.image.tag | string | `"7.39.1"` |  |
| stream.dogstatsd.image.tag | string | `"7.39.1"` |  |
| results.dogstatsd.image.tag | string | `"7.39.1"` |  |
| api.dogstatsd.image.tag | string | `"7.39.1"` |  |
| reportsgenerator.dogstatsd.image.tag | string | `"7.39.1"` |  |
| scanengine.dogstatsd.image.tag | string | `"7.39.1"` |  |
| persistence.dogstatsd.image.tag | string | `"7.39.1"` |  |
| metrics.dogstatsd.enabled | bool | `true` |  |
| reportsgenerator.dogstatsd.enabled | bool | `true` |  |
| api.dogstatsd.enabled | bool | `true` |  |
| persistence.dogstatsd.enabled | bool | `true` |  |
| results.dogstatsd.enabled | bool | `true` |  |
| scanengine.dogstatsd.enabled | bool | `true` |  |
| stream.dogstatsd.enabled | bool | `true` |  |
| metrics.<<.replicaCount | string | `nil` |  |
| sqsexporter.<<.replicaCount | string | `nil` |  |
| stream.<<.replicaCount | string | `nil` |  |
| crontinuous.<<.replicaCount | string | `nil` |  |
| persistence.<<.replicaCount | string | `nil` |  |
| results.<<.replicaCount | string | `nil` |  |
| ui.<<.replicaCount | string | `nil` |  |
| scanengine.<<.replicaCount | string | `nil` |  |
| vulndbapi.<<.replicaCount | string | `nil` |  |
| api.<<.replicaCount | string | `nil` |  |
| vulndb.<<.replicaCount | string | `nil` |  |
| goaws.<<.replicaCount | string | `nil` |  |
| insights.<<.replicaCount | string | `nil` |  |
| reportsgenerator.<<.replicaCount | string | `nil` |  |
| goaws.<<.image.pullPolicy | string | `"Always"` |  |
| vulndb.<<.image.pullPolicy | string | `"Always"` |  |
| ui.<<.image.pullPolicy | string | `"Always"` |  |
| api.<<.image.pullPolicy | string | `"Always"` |  |
| vulndbapi.<<.image.pullPolicy | string | `"Always"` |  |
| reportsgenerator.<<.image.pullPolicy | string | `"Always"` |  |
| scanengine.<<.image.pullPolicy | string | `"Always"` |  |
| crontinuous.<<.image.pullPolicy | string | `"Always"` |  |
| persistence.<<.image.pullPolicy | string | `"Always"` |  |
| sqsexporter.<<.image.pullPolicy | string | `"Always"` |  |
| results.<<.image.pullPolicy | string | `"Always"` |  |
| stream.<<.image.pullPolicy | string | `"Always"` |  |
| metrics.<<.image.pullPolicy | string | `"Always"` |  |
| insights.<<.image.pullPolicy | string | `"Always"` |  |
| persistence.<<.extraPodLabels | object | `{}` | custom extra labels |
| ui.<<.extraPodLabels | object | `{}` | custom extra labels |
| insights.<<.extraPodLabels | object | `{}` | custom extra labels |
| results.<<.extraPodLabels | object | `{}` | custom extra labels |
| goaws.<<.extraPodLabels | object | `{}` | custom extra labels |
| metrics.<<.extraPodLabels | object | `{}` | custom extra labels |
| anchors.comp.extraPodLabels | object | `{}` | custom extra labels |
| reportsgenerator.<<.extraPodLabels | object | `{}` | custom extra labels |
| crontinuous.<<.extraPodLabels | object | `{}` | custom extra labels |
| vulndbapi.<<.extraPodLabels | object | `{}` | custom extra labels |
| vulndb.<<.extraPodLabels | object | `{}` | custom extra labels |
| sqsexporter.<<.extraPodLabels | object | `{}` | custom extra labels |
| scanengine.<<.extraPodLabels | object | `{}` | custom extra labels |
| stream.<<.extraPodLabels | object | `{}` | custom extra labels |
| api.<<.extraPodLabels | object | `{}` | custom extra labels |
| persistence.<<.extraEnv | object | `{}` | custom env variables |
| scanengine.<<.extraEnv | object | `{}` | custom env variables |
| reportsgenerator.<<.extraEnv | object | `{}` | custom env variables |
| api.<<.extraEnv | object | `{}` | custom env variables |
| vulndb.<<.extraEnv | object | `{}` | custom env variables |
| sqsexporter.<<.extraEnv | object | `{}` | custom env variables |
| crontinuous.<<.extraEnv | object | `{}` | custom env variables |
| vulndbapi.<<.extraEnv | object | `{}` | custom env variables |
| anchors.comp.extraEnv | object | `{}` | custom env variables |
| metrics.<<.extraEnv | object | `{}` | custom env variables |
| ui.<<.extraEnv | object | `{}` | custom env variables |
| results.<<.extraEnv | object | `{}` | custom env variables |
| goaws.<<.extraEnv | object | `{}` | custom env variables |
| insights.<<.extraEnv | object | `{}` | custom env variables |
| stream.<<.extraEnv | object | `{}` | custom env variables |
| goaws.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| anchors.comp.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| results.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| insights.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| crontinuous.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| sqsexporter.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| stream.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| vulndbapi.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| scanengine.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| metrics.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| persistence.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| api.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| ui.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| vulndb.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| reportsgenerator.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| scanengine.<<.podSecurityContext | object | `{}` |  |
| vulndb.<<.podSecurityContext | object | `{}` |  |
| stream.<<.podSecurityContext | object | `{}` |  |
| persistence.<<.podSecurityContext | object | `{}` |  |
| vulndbapi.<<.podSecurityContext | object | `{}` |  |
| api.<<.podSecurityContext | object | `{}` |  |
| metrics.<<.podSecurityContext | object | `{}` |  |
| goaws.<<.podSecurityContext | object | `{}` |  |
| sqsexporter.<<.podSecurityContext | object | `{}` |  |
| crontinuous.<<.podSecurityContext | object | `{}` |  |
| insights.<<.podSecurityContext | object | `{}` |  |
| results.<<.podSecurityContext | object | `{}` |  |
| reportsgenerator.<<.podSecurityContext | object | `{}` |  |
| ui.<<.podSecurityContext | object | `{}` |  |
| reportsgenerator.<<.securityContext | object | `{}` |  |
| scanengine.<<.securityContext | object | `{}` |  |
| stream.<<.securityContext | object | `{}` |  |
| results.<<.securityContext | object | `{}` |  |
| crontinuous.<<.securityContext | object | `{}` |  |
| insights.<<.securityContext | object | `{}` |  |
| vulndbapi.<<.securityContext | object | `{}` |  |
| persistence.<<.securityContext | object | `{}` |  |
| vulndb.<<.securityContext | object | `{}` |  |
| ui.<<.securityContext | object | `{}` |  |
| metrics.<<.securityContext | object | `{}` |  |
| sqsexporter.<<.securityContext | object | `{}` |  |
| goaws.<<.securityContext | object | `{}` |  |
| api.<<.securityContext | object | `{}` |  |
| scanengine.<<.imagePullSecrets | list | `[]` |  |
| ui.<<.imagePullSecrets | list | `[]` |  |
| sqsexporter.<<.imagePullSecrets | list | `[]` |  |
| metrics.<<.imagePullSecrets | list | `[]` |  |
| vulndb.<<.imagePullSecrets | list | `[]` |  |
| persistence.<<.imagePullSecrets | list | `[]` |  |
| crontinuous.<<.imagePullSecrets | list | `[]` |  |
| goaws.<<.imagePullSecrets | list | `[]` |  |
| stream.<<.imagePullSecrets | list | `[]` |  |
| reportsgenerator.<<.imagePullSecrets | list | `[]` |  |
| vulndbapi.<<.imagePullSecrets | list | `[]` |  |
| insights.<<.imagePullSecrets | list | `[]` |  |
| api.<<.imagePullSecrets | list | `[]` |  |
| results.<<.imagePullSecrets | list | `[]` |  |
| persistence.<<.nameOverride | string | `""` |  |
| scanengine.<<.nameOverride | string | `""` |  |
| metrics.<<.nameOverride | string | `""` |  |
| goaws.<<.nameOverride | string | `""` |  |
| vulndb.<<.nameOverride | string | `""` |  |
| api.<<.nameOverride | string | `""` |  |
| insights.<<.nameOverride | string | `""` |  |
| crontinuous.<<.nameOverride | string | `""` |  |
| ui.<<.nameOverride | string | `""` |  |
| stream.<<.nameOverride | string | `""` |  |
| sqsexporter.<<.nameOverride | string | `""` |  |
| reportsgenerator.<<.nameOverride | string | `""` |  |
| vulndbapi.<<.nameOverride | string | `""` |  |
| results.<<.nameOverride | string | `""` |  |
| results.<<.fullnameOverride | string | `""` |  |
| api.<<.fullnameOverride | string | `""` |  |
| goaws.<<.fullnameOverride | string | `""` |  |
| ui.<<.fullnameOverride | string | `""` |  |
| persistence.<<.fullnameOverride | string | `""` |  |
| vulndb.<<.fullnameOverride | string | `""` |  |
| stream.<<.fullnameOverride | string | `""` |  |
| crontinuous.<<.fullnameOverride | string | `""` |  |
| insights.<<.fullnameOverride | string | `""` |  |
| vulndbapi.<<.fullnameOverride | string | `""` |  |
| sqsexporter.<<.fullnameOverride | string | `""` |  |
| metrics.<<.fullnameOverride | string | `""` |  |
| reportsgenerator.<<.fullnameOverride | string | `""` |  |
| scanengine.<<.fullnameOverride | string | `""` |  |
| reportsgenerator.<<.containerPort | int | `8080` |  |
| vulndb.<<.containerPort | int | `8080` |  |
| insights.<<.containerPort | int | `8080` |  |
| sqsexporter.<<.containerPort | int | `8080` |  |
| vulndbapi.<<.containerPort | int | `8080` |  |
| results.<<.containerPort | int | `8080` |  |
| stream.<<.containerPort | int | `8080` |  |
| crontinuous.<<.containerPort | int | `8080` |  |
| api.<<.containerPort | int | `8080` |  |
| ui.<<.containerPort | int | `8080` |  |
| persistence.<<.containerPort | int | `8080` |  |
| metrics.<<.containerPort | int | `8080` |  |
| scanengine.<<.containerPort | int | `8080` |  |
| goaws.<<.containerPort | int | `8080` |  |
| crontinuous.<<.lifecycle.preStopSleep | int | `30` |  |
| results.<<.lifecycle.preStopSleep | int | `30` |  |
| goaws.<<.lifecycle.preStopSleep | int | `30` |  |
| vulndb.<<.lifecycle.preStopSleep | int | `30` |  |
| scanengine.<<.lifecycle.preStopSleep | int | `30` |  |
| vulndbapi.<<.lifecycle.preStopSleep | int | `30` |  |
| metrics.<<.lifecycle.preStopSleep | int | `30` |  |
| reportsgenerator.<<.lifecycle.preStopSleep | int | `30` |  |
| api.<<.lifecycle.preStopSleep | int | `30` |  |
| ui.<<.lifecycle.preStopSleep | int | `30` |  |
| sqsexporter.<<.lifecycle.preStopSleep | int | `30` |  |
| persistence.<<.lifecycle.preStopSleep | int | `30` |  |
| insights.<<.lifecycle.preStopSleep | int | `30` |  |
| stream.<<.lifecycle.preStopSleep | int | `30` |  |
| ui.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| sqsexporter.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| results.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| stream.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| insights.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| api.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| anchors.comp.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| metrics.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| vulndb.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| reportsgenerator.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| scanengine.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| goaws.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| vulndbapi.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| crontinuous.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| persistence.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| vulndbapi.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| crontinuous.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| vulndb.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| persistence.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| ui.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| api.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| stream.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| insights.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| metrics.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| results.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| sqsexporter.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| anchors.comp.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| reportsgenerator.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| goaws.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| scanengine.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| ui.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| persistence.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| reportsgenerator.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| api.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| scanengine.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| crontinuous.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| insights.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| goaws.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| vulndb.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| sqsexporter.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| results.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| metrics.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| vulndbapi.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| stream.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| anchors.comp.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| vulndb.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| vulndbapi.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| stream.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| scanengine.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| anchors.comp.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| crontinuous.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| sqsexporter.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| goaws.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| insights.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| persistence.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| api.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| results.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| ui.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| metrics.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| reportsgenerator.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| goaws.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| reportsgenerator.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| anchors.comp.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| vulndbapi.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| ui.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| sqsexporter.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| metrics.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| api.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| stream.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| scanengine.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| insights.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| crontinuous.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| results.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| persistence.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| vulndb.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| api.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| crontinuous.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| ui.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| goaws.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| reportsgenerator.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| persistence.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| vulndbapi.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| insights.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| vulndb.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| sqsexporter.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| metrics.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| anchors.comp.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| results.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| stream.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| scanengine.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| stream.<<.resources | object | `{}` |  |
| vulndbapi.<<.resources | object | `{}` |  |
| ui.<<.resources | object | `{}` |  |
| vulndb.<<.resources | object | `{}` |  |
| goaws.<<.resources | object | `{}` |  |
| insights.<<.resources | object | `{}` |  |
| results.<<.resources | object | `{}` |  |
| api.<<.resources | object | `{}` |  |
| reportsgenerator.<<.resources | object | `{}` |  |
| sqsexporter.<<.resources | object | `{}` |  |
| crontinuous.<<.resources | object | `{}` |  |
| scanengine.<<.resources | object | `{}` |  |
| metrics.<<.resources | object | `{}` |  |
| persistence.<<.resources | object | `{}` |  |
| metrics.<<.nodeSelector | object | `{}` |  |
| sqsexporter.<<.nodeSelector | object | `{}` |  |
| persistence.<<.nodeSelector | object | `{}` |  |
| ui.<<.nodeSelector | object | `{}` |  |
| stream.<<.nodeSelector | object | `{}` |  |
| goaws.<<.nodeSelector | object | `{}` |  |
| vulndbapi.<<.nodeSelector | object | `{}` |  |
| vulndb.<<.nodeSelector | object | `{}` |  |
| reportsgenerator.<<.nodeSelector | object | `{}` |  |
| crontinuous.<<.nodeSelector | object | `{}` |  |
| api.<<.nodeSelector | object | `{}` |  |
| results.<<.nodeSelector | object | `{}` |  |
| scanengine.<<.nodeSelector | object | `{}` |  |
| insights.<<.nodeSelector | object | `{}` |  |
| api.<<.tolerations | list | `[]` |  |
| metrics.<<.tolerations | list | `[]` |  |
| vulndb.<<.tolerations | list | `[]` |  |
| crontinuous.<<.tolerations | list | `[]` |  |
| reportsgenerator.<<.tolerations | list | `[]` |  |
| ui.<<.tolerations | list | `[]` |  |
| stream.<<.tolerations | list | `[]` |  |
| goaws.<<.tolerations | list | `[]` |  |
| insights.<<.tolerations | list | `[]` |  |
| scanengine.<<.tolerations | list | `[]` |  |
| sqsexporter.<<.tolerations | list | `[]` |  |
| results.<<.tolerations | list | `[]` |  |
| persistence.<<.tolerations | list | `[]` |  |
| vulndbapi.<<.tolerations | list | `[]` |  |
| results.<<.affinity | object | `{}` |  |
| scanengine.<<.affinity | object | `{}` |  |
| persistence.<<.affinity | object | `{}` |  |
| insights.<<.affinity | object | `{}` |  |
| crontinuous.<<.affinity | object | `{}` |  |
| api.<<.affinity | object | `{}` |  |
| sqsexporter.<<.affinity | object | `{}` |  |
| vulndb.<<.affinity | object | `{}` |  |
| goaws.<<.affinity | object | `{}` |  |
| ui.<<.affinity | object | `{}` |  |
| reportsgenerator.<<.affinity | object | `{}` |  |
| stream.<<.affinity | object | `{}` |  |
| vulndbapi.<<.affinity | object | `{}` |  |
| metrics.<<.affinity | object | `{}` |  |
| waitfordb.image.repository | string | `"busybox"` |  |
| waitfordb.image.tag | string | `"1.35.0"` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.service.port | int | `5432` |  |
| postgresql.auth.username | string | `"postgres"` |  |
| postgresql.auth.postgresPassword | string | `"TBD"` |  |
| postgresql.auth.password | string | `"TBD"` |  |
| postgresql.auth.database | string | `"persistence"` |  |
| postgresql.primary.initdb.scripts."initial-dbs.sql" | string | `"CREATE DATABASE api;\nCREATE DATABASE scanengine;\nCREATE DATABASE reportsgenerator;\nCREATE DATABASE vulnerabilitydb;\n"` |  |
| postgresql.primary.resources.requests.cpu | string | `"0"` |  |
| postgresql.primary.resources.requests.memory | string | `"0"` |  |
| postgresql.primary.persistence.enabled | bool | `false` |  |
| postgresql.primary.annotations."prometheus.io/scrape" | string | `"true"` |  |
| postgresql.primary.annotations."prometheus.io/port" | string | `"9187"` |  |
| postgresql.metrics.enabled | bool | `true` |  |
| redis.enabled | bool | `false` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.enabled | bool | `false` |  |
| redis.master.service.ports.redis | int | `6379` |  |
| redis.master.persistence.enabled | bool | `false` |  |
| redis.serviceAccount.create | bool | `false` |  |
| goaws.enabled | bool | `false` |  |
| goaws.name | string | `"goaws"` |  |
| goaws.image.repository | string | `"pafortin/goaws"` |  |
| goaws.image.tag | string | `"v0.3.1"` |  |
| goaws.image.pullPolicy | string | `"Always"` |  |
| goaws.containerPort | int | `8080` |  |
| goaws.config."goaws.yaml" | string | `"Local:\n  Host: {{ include \"goaws.fullname\" . }}\n  Port: {{ .Values.goaws.containerPort }}\n  AccountId: \"012345678900\"\n  LogToFile: false\n  QueueAttributeDefaults:\n    VisibilityTimeout: 30\n    ReceiveMessageWaitTimeSeconds: 0\n  Queues:\n    - Name: VulcanK8SAPIScans\n    - Name: VulcanK8SMetricsChecks\n    - Name: VulcanK8SMetricsFindings\n    - Name: VulcanK8SMetricsScans\n    - Name: VulcanK8SReportsGenerator\n    - Name: VulcanK8SScanEngineCheckStatus\n    - Name: VulcanK8SV2ChecksGeneric\n    {{- range $value := .Values.scanengine.conf.queues.other }}\n    - Name: {{ regexFind \"[^:]+$\" $value.arn }}\n    {{- end }}\n    - Name: VulcanK8SVulnDBChecks\n  Topics:\n    - Name: VulcanK8SChecks\n      Subscriptions:\n        - QueueName: VulcanK8SMetricsChecks\n          Raw: true\n        - QueueName: VulcanK8SVulnDBChecks\n          Raw: true\n    - Name: VulcanK8SScans\n      Subscriptions:\n        - QueueName: VulcanK8SAPIScans\n          Raw: true\n        - QueueName: VulcanK8SMetricsScans\n          Raw: true\n    - Name: VulcanK8SReportsGen\n      Subscriptions:\n        - QueueName: VulcanK8SReportsGenerator\n          Raw: true\n    - Name: VulcanK8SVulnDBVulns\n      Subscriptions:\n        - QueueName: VulcanK8SMetricsFindings\n          Raw: true\n  RandomLatency:\n    Min: 0\n    Max: 0\n"` |  |
| minio.enabled | bool | `false` |  |
| minio.nameOverride | string | `"minio"` |  |
| minio.mode | string | `"standalone"` |  |
| minio.defaultBuckets | string | `"reports,logs,scans,insights,public-insights,crontinuous"` |  |
| minio.serviceAccount.create | bool | `false` |  |
| minio.persistence.enabled | bool | `false` |  |
| minio.service.ports.api | int | `80` |  |
| minio.auth.rootUser | string | `"AKIAIOSFODNN7EXAMPLE"` |  |
| minio.auth.rootPassword | string | `"wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"` |  |
| minio.extraEnv[0].name | string | `"MINIO_REGION_NAME"` |  |
| minio.extraEnv[0].value | string | `"local"` |  |
| results.enabled | bool | `true` |  |
| results.name | string | `"results"` |  |
| results.image.repository | string | `"adevinta/vulcan-results"` |  |
| results.image.tag | string | `"1.0"` |  |
| results.image.pullPolicy | string | `"Always"` |  |
| results.conf.debug | string | `"false"` |  |
| results.conf.region | string | `nil` |  |
| results.conf.bucketReports | string | `"reports"` |  |
| results.conf.bucketLogs | string | `"logs"` |  |
| results.conf.linkBase | string | `"http://chart-example.local"` |  |
| results.healthcheckPath | string | `"/healthcheck"` |  |
| results.meta.s3 | bool | `true` |  |
| persistence.enabled | bool | `true` |  |
| persistence.name | string | `"persistence"` |  |
| persistence.image.repository | string | `"adevinta/vulcan-persistence"` |  |
| persistence.image.tag | string | `"1.0"` |  |
| persistence.image.pullPolicy | string | `"Always"` |  |
| persistence.healthcheckPath | string | `"/status"` |  |
| persistence.meta.s3 | bool | `true` |  |
| persistence.meta.sns | bool | `true` |  |
| persistence.meta.sqs | bool | `true` |  |
| persistence.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"name":"persistence"}` | postgres database settings |
| persistence.conf.logLevel | string | `"warn"` |  |
| persistence.conf.secretKeyBase | string | `"TBDTBD"` |  |
| persistence.conf.railsMaxThreads | int | `4` |  |
| stream.enabled | bool | `true` |  |
| stream.name | string | `"stream"` |  |
| stream.image.repository | string | `"adevinta/vulcan-stream"` |  |
| stream.image.tag | string | `"1.0"` |  |
| stream.image.pullPolicy | string | `"Always"` |  |
| stream.healthcheckPath | string | `"/status"` |  |
| stream.conf.logLevel | string | `"DEBUG"` |  |
| stream.conf.ttl | int | `0` |  |
| stream.redis.host | string | `nil` |  |
| stream.redis.port | string | `nil` |  |
| stream.redis.username | string | `nil` |  |
| stream.redis.password | string | `nil` |  |
| stream.redis.db | int | `0` |  |
| api.enabled | bool | `true` |  |
| api.name | string | `"api"` |  |
| api.image.repository | string | `"adevinta/vulcan-api"` |  |
| api.image.tag | string | `"1.0"` |  |
| api.image.pullPolicy | string | `"Always"` |  |
| api.meta.sqs | bool | `true` |  |
| api.meta.sns | bool | `true` |  |
| api.meta.s3 | bool | `true` |  |
| api.healthcheckPath | string | `"/api/v1/healthcheck"` |  |
| api.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"name":"api"}` | postgres database settings |
| api.conf.debug | string | `"false"` |  |
| api.conf.bucketReports | string | `"reports"` |  |
| api.conf.bucketLogs | string | `"logs"` |  |
| api.conf.s3PrivateBucket | string | `"insights"` |  |
| api.conf.s3PublicBucket | string | `"public-insights"` |  |
| api.conf.queueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SAPIScans"` |  |
| api.conf.queueName | string | `"VulcanK8SAPIScans"` |  |
| api.conf.reports.snsArn | string | `"arn:aws:sns:local:012345678900:VulcanK8SReportsGen"` |  |
| api.conf.reports.redirectUrl | string | `nil` |  |
| api.conf.reports.vulcanUIUrl | string | `nil` |  |
| api.conf.secretKey | string | `"TBDTBD"` |  |
| api.conf.cookieDomain | string | `nil` |  |
| api.conf.saml.metadata | string | `"https://okta/app/TBD/sso/saml/metadata"` |  |
| api.conf.saml.issuer | string | `"http://okta/TBD"` |  |
| api.conf.saml.callback | string | `nil` |  |
| api.conf.saml.trustedDomains | string | `"[]"` |  |
| api.conf.logLevel | string | `"INFO"` |  |
| api.conf.defaultOwners | string | `"[]"` |  |
| api.conf.vulndbapiUrl | string | `nil` |  |
| api.conf.persistenceHost | string | `nil` |  |
| api.conf.crontinuousUrl | string | `nil` |  |
| api.conf.reportsgeneratorUrl | string | `nil` |  |
| api.conf.scanengineUrl | string | `nil` |  |
| api.conf.apiHostname | string | `nil` |  |
| api.conf.awscatalogue.kind | string | `"None"` |  |
| api.conf.awscatalogue.url | string | `"http://catalogue.example.com"` |  |
| api.conf.awscatalogue.key | string | `"key"` |  |
| api.conf.awscatalogue.retries | int | `1` |  |
| api.conf.awscatalogue.retry_interval | int | `2` |  |
| api.conf.globalPolicies | string | `nil` | array of name/allowedAssettypes/blockedAssettypes/allowedChecks/blockedChecks/excludingSuffixes which allows to customise global program policies |
| api.ingress.path | string | `"/api"` |  |
| crontinuous.enabled | bool | `true` |  |
| crontinuous.name | string | `"crontinuous"` |  |
| crontinuous.image.repository | string | `"adevinta/vulcan-crontinuous"` |  |
| crontinuous.image.tag | string | `"1.0"` |  |
| crontinuous.image.pullPolicy | string | `"Always"` |  |
| crontinuous.meta.s3 | bool | `true` |  |
| crontinuous.healthcheckPath | string | `"/healthcheck"` |  |
| crontinuous.conf.region | string | `nil` |  |
| crontinuous.conf.vulcanToken | string | `"TBDTBDTBD"` |  |
| crontinuous.conf.crontinuousBucket | string | `"crontinuous"` |  |
| crontinuous.conf.vulcanUser | string | `"tbd"` |  |
| crontinuous.conf.vulcanApi | string | `nil` |  |
| crontinuous.conf.enableTeamsWhitelistScan | string | `"false"` |  |
| crontinuous.conf.teamsWhitelistScan | string | `"[]"` |  |
| crontinuous.conf.enableTeamsWhitelistReport | string | `"false"` |  |
| crontinuous.conf.teamsWhitelistReport | string | `"[]"` |  |
| scanengine.enabled | bool | `true` |  |
| scanengine.name | string | `"scanengine"` |  |
| scanengine.image.repository | string | `"adevinta/vulcan-scan-engine"` |  |
| scanengine.image.tag | string | `"1.0"` |  |
| scanengine.image.pullPolicy | string | `"Always"` |  |
| scanengine.healthcheckPath | string | `"/v1/healthcheck"` |  |
| scanengine.meta.sqs | bool | `true` |  |
| scanengine.meta.sns | bool | `true` |  |
| scanengine.conf.logLevel | string | `"error"` |  |
| scanengine.conf.queueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SScanEngineCheckStatus"` |  |
| scanengine.conf.queueName | string | `"VulcanK8SScanEngineCheckStatus"` |  |
| scanengine.conf.scansSNS.topicArn | string | `"arn:aws:sns:local:012345678900:VulcanK8SScans"` |  |
| scanengine.conf.checksSNS.topicArn | string | `"arn:aws:sns:local:012345678900:VulcanK8SChecks"` |  |
| scanengine.conf.queues.default.arn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SV2ChecksGeneric"` |  |
| scanengine.conf.queues.other | string | `nil` | array of arn/checktypes |
| scanengine.conf.persistenceHost | string | `nil` |  |
| scanengine.conf.streamUrl | string | `nil` |  |
| scanengine.conf.checkCreator.numOfWorkers | int | `2` |  |
| scanengine.conf.checkCreator.period | int | `20` |  |
| scanengine.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"name":"scanengine"}` | postgres database settings |
| ui.enabled | bool | `true` |  |
| ui.name | string | `"ui"` |  |
| ui.image.repository | string | `"adevinta/vulcan-ui"` |  |
| ui.image.tag | string | `"1.0"` |  |
| ui.image.pullPolicy | string | `"Always"` |  |
| ui.healthcheckPath | string | `"/index.html"` |  |
| ui.meta.sqs | bool | `false` |  |
| ui.conf.apiUrl | string | `nil` |  |
| ui.conf.docs.apiLink | string | `"https://docs.example.com/vulcan/vulcan-api/"` |  |
| ui.conf.docs.whitelistingLink | string | `nil` |  |
| ui.conf.docs.discoveryLink | string | `"https://docs.example.com/vulcan/discovery"` |  |
| ui.conf.docs.auditRoleLink | string | `"https://docs.example.com/vulcan/network-access"` |  |
| ui.conf.contact.email | string | `"vulcan@example.com"` |  |
| ui.conf.contact.slack | string | `"https://example.slack.com/archives/XXXXX"` |  |
| ui.conf.dashboard.link | string | `nil` | if not set redirects to UI's dashboard.html |
| insights.enabled | bool | `true` |  |
| insights.name | string | `"insights"` |  |
| insights.image.repository | string | `"pottava/s3-proxy"` |  |
| insights.image.tag | string | `"2.0"` |  |
| insights.image.pullPolicy | string | `"Always"` |  |
| insights.healthcheckPath | string | `"/healthcheck"` |  |
| insights.proxy | object | `{"<<":{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.19-alpine3.16"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null},"cache":{"enabled":true},"enabled":true}` | proxy settings. mandatory for insights |
| insights.conf.region | string | `nil` |  |
| insights.conf.log | string | `"false"` |  |
| insights.conf.private.name | string | `"private"` |  |
| insights.conf.private.s3Bucket | string | `"insights"` |  |
| insights.conf.private.prefix | string | `""` |  |
| insights.conf.public.name | string | `"public"` |  |
| insights.conf.public.s3Bucket | string | `"public-insights"` |  |
| insights.conf.public.prefix | string | `"/public"` |  |
| reportsgenerator.enabled | bool | `true` |  |
| reportsgenerator.name | string | `"reportsgenerator"` |  |
| reportsgenerator.image.repository | string | `"adevinta/vulcan-reports-generator"` |  |
| reportsgenerator.image.tag | string | `"1.0"` |  |
| reportsgenerator.image.pullPolicy | string | `"Always"` |  |
| reportsgenerator.healthcheckPath | string | `"/healthcheck"` |  |
| reportsgenerator.meta.sqs | bool | `true` |  |
| reportsgenerator.conf.logLevel | string | `"error"` |  |
| reportsgenerator.conf.queueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SReportsGenerator"` |  |
| reportsgenerator.conf.queueName | string | `"VulcanK8SReportsGenerator"` |  |
| reportsgenerator.conf.scanengineUrl | string | `nil` |  |
| reportsgenerator.conf.resultsUrl | string | `nil` |  |
| reportsgenerator.conf.generators.scan.emailSubject | string | `"Security Overview"` |  |
| reportsgenerator.conf.generators.scan.publicBucket | string | `"public-insights"` |  |
| reportsgenerator.conf.generators.scan.privateBucket | string | `"insights"` |  |
| reportsgenerator.conf.generators.scan.gaId | string | `"UA-000000000-0"` |  |
| reportsgenerator.conf.generators.scan.proxyEndpoint | string | `nil` |  |
| reportsgenerator.conf.generators.scan.contact.companyName | string | `"Example"` |  |
| reportsgenerator.conf.generators.scan.contact.email | string | `"vulcan@example.com"` |  |
| reportsgenerator.conf.generators.scan.contact.jira | string | `"https://jira.example.com/"` |  |
| reportsgenerator.conf.generators.scan.contact.slackChannel | string | `"https://example.slack.com/archives/XXXXX"` |  |
| reportsgenerator.conf.generators.scan.contact.supportEmail | string | `"vulcan@example.com"` |  |
| reportsgenerator.conf.generators.scan.docs.apiDocLink | string | `"https://docs.example.com/vulcan/vulcan-api/examples/#how-do-i-list-the-members-of-a-team"` |  |
| reportsgenerator.conf.generators.scan.docs.roadmapLink | string | `"https://docs.example.com/vulcan/roadmap"` |  |
| reportsgenerator.conf.generators.scan.vulcanUi | string | `nil` |  |
| reportsgenerator.conf.generators.scan.viewReport | string | `nil` |  |
| reportsgenerator.conf.generators.scan.redirectUrl | string | `nil` |  |
| reportsgenerator.conf.generators.livereport.emailSubject | string | `nil` |  |
| reportsgenerator.conf.ses.region | string | `nil` |  |
| reportsgenerator.conf.ses.from | string | `"tbd@tbd.com"` |  |
| reportsgenerator.conf.ses.cc | string | `"[\"tbd@tbd.com\"]"` |  |
| reportsgenerator.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"name":"reportsgenerator"}` | postgres database settings |
| metrics.enabled | bool | `true` |  |
| metrics.name | string | `"metrics"` |  |
| metrics.image.repository | string | `"containers.mpi-internal.com/spt-security/vulcan-metrics"` |  |
| metrics.image.tag | string | `"1.0"` |  |
| metrics.image.pullPolicy | string | `"Always"` |  |
| metrics.proxy.enabled | bool | `false` |  |
| metrics.conf.region | string | `nil` |  |
| metrics.conf.logLevel | string | `"warn"` |  |
| metrics.conf.sqsPollingInterval | int | `10` |  |
| metrics.conf.checksQueueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SMetricsChecks"` |  |
| metrics.conf.scansQueueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SMetricsScans"` |  |
| metrics.conf.findingsQueueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SMetricsFindings"` |  |
| metrics.conf.resultsScheme | string | `"http"` |  |
| metrics.conf.devHoseURL | string | `"http://devhose/devhose"` |  |
| metrics.conf.devHoseToken | string | `"token"` |  |
| metrics.conf.devHoseTenant | string | `"tbd"` |  |
| metrics.conf.devHoseMetricsSource | string | `"tbd"` |  |
| metrics.conf.devHoseFindingsSource | string | `"tbd"` |  |
| metrics.conf.vulcanApi | string | `nil` |  |
| metrics.conf.vulcanAPIToken | string | `"token"` |  |
| metrics.conf.vulcanAPIExternal | string | `nil` |  |
| metrics.redis.image | string | `"bitnami/redis:6.2.7"` |  |
| metrics.meta.sqs | bool | `true` |  |
| vulndbapi.enabled | bool | `true` |  |
| vulndbapi.name | string | `"vulndbapi"` |  |
| vulndbapi.image.repository | string | `"adevinta/vulnerability-db-api"` |  |
| vulndbapi.image.tag | string | `"1.0"` |  |
| vulndbapi.image.pullPolicy | string | `"Always"` |  |
| vulndbapi.healthcheckPath | string | `"/healthcheck"` |  |
| vulndbapi.conf.logLevel | string | `"info"` |  |
| vulndbapi.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"name":"vulnerabilitydb"}` | postgres database settings |
| vulndb.enabled | bool | `true` |  |
| vulndb.name | string | `"vulndb"` |  |
| vulndb.image.repository | string | `"adevinta/vulnerability-db"` |  |
| vulndb.image.tag | string | `"1.0"` |  |
| vulndb.image.pullPolicy | string | `"Always"` |  |
| vulndb.conf.logLevel | string | `"error"` |  |
| vulndb.conf.checksQueueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SVulnDBChecks"` |  |
| vulndb.conf.vulnsTopicArn | string | `"arn:aws:sns:local:012345678900:VulcanK8SVulnDBVulns"` |  |
| vulndb.conf.maxEventAge | int | `365` |  |
| vulndb.conf.resultsUrl | string | `"http://vulcan-results.vulcan.com"` |  |
| vulndb.conf.resultsInternalUrl | string | `nil` |  |
| vulndb.proxy.enabled | bool | `false` |  |
| vulndb.meta.sqs | bool | `true` |  |
| vulndb.meta.sns | bool | `true` |  |
| vulndb.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"name":"vulnerabilitydb"}` | postgres database settings |
| sqsexporter.enabled | bool | `true` |  |
| sqsexporter.name | string | `"sqsexporter"` |  |
| sqsexporter.image.repository | string | `"jesusfcr/sqs-prometheus-exporter"` |  |
| sqsexporter.image.tag | string | `"0.4.0"` |  |
| sqsexporter.image.pullPolicy | string | `"Always"` |  |
| sqsexporter.queueNamePrefix | string | `"VulcanK8S"` |  |
| sqsexporter.meta.sqs | bool | `true` |  |
| dogstatsd.name | string | `"dogstatsd"` |  |
| dogstatsd.apiKey | string | `"TBD"` |  |
| extraManifests | object | `{}` | Allows to inject custom manifests that would be processed as templates |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
