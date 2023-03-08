# vulcan

![Version: 0.5.6](https://img.shields.io/badge/Version-0.5.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A Helm chart for deploying Vulcan

**Homepage:** <https://github.com/adevinta/vulcan-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Adevinta | <vulcan@adevinta.com> |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | minio | 12.6.4 |
| https://charts.bitnami.com/bitnami | postgresql | 12.5.7 |
| https://charts.bitnami.com/bitnami | redis | 17.11.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.domain | string | `"vulcan.local"` |  |
| global.region | string | `"local"` |  |
| global.podLabels | object | `{}` | custom labels for all components |
| anchors | object | `{"comp":{"affinity":{},"autoscaling":{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null},"containerPort":8080,"extraEnv":{},"extraPodLabels":{},"fullnameOverride":"","image":{"pullPolicy":"Always"},"imagePullSecrets":[],"ingress":{"annotations":{},"enabled":false,"hosts":[],"tls":[]},"lifecycle":{"preStopSleep":30},"livenessProbe":{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3},"meta":{"s3":false,"sns":false,"sqs":false},"nameOverride":"","nodeSelector":{},"podSecurityContext":{},"proxy":{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null},"readinessProbe":{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3},"replicaCount":null,"resources":{},"securityContext":{},"service":{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"},"tolerations":[]},"db":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"dogstatsd":{"enabled":true,"image":{"repository":"datadog/dogstatsd","tag":"7.42.2"}}}` | Anchors |
| anchors.db | object | `{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null}` | postgres database settings |
| persistence.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| scanengine.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| stream.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| reportsgenerator.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| tracker.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| metrics.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| api.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| results.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| scanengine.dogstatsd.image.tag | string | `"7.42.2"` |  |
| metrics.dogstatsd.image.tag | string | `"7.42.2"` |  |
| api.dogstatsd.image.tag | string | `"7.42.2"` |  |
| stream.dogstatsd.image.tag | string | `"7.42.2"` |  |
| results.dogstatsd.image.tag | string | `"7.42.2"` |  |
| persistence.dogstatsd.image.tag | string | `"7.42.2"` |  |
| tracker.dogstatsd.image.tag | string | `"7.42.2"` |  |
| reportsgenerator.dogstatsd.image.tag | string | `"7.42.2"` |  |
| api.dogstatsd.enabled | bool | `true` |  |
| metrics.dogstatsd.enabled | bool | `true` |  |
| stream.dogstatsd.enabled | bool | `true` |  |
| tracker.dogstatsd.enabled | bool | `true` |  |
| reportsgenerator.dogstatsd.enabled | bool | `true` |  |
| results.dogstatsd.enabled | bool | `true` |  |
| scanengine.dogstatsd.enabled | bool | `true` |  |
| persistence.dogstatsd.enabled | bool | `true` |  |
| insights.<<.replicaCount | string | `nil` |  |
| stream.<<.replicaCount | string | `nil` |  |
| sqsexporter.<<.replicaCount | string | `nil` |  |
| reportsgenerator.<<.replicaCount | string | `nil` |  |
| tracker.<<.replicaCount | string | `nil` |  |
| vulndbapi.<<.replicaCount | string | `nil` |  |
| crontinuous.<<.replicaCount | string | `nil` |  |
| scanengine.<<.replicaCount | string | `nil` |  |
| results.<<.replicaCount | string | `nil` |  |
| goaws.<<.replicaCount | string | `nil` |  |
| vulndb.<<.replicaCount | string | `nil` |  |
| api.<<.replicaCount | string | `nil` |  |
| persistence.<<.replicaCount | string | `nil` |  |
| ui.<<.replicaCount | string | `nil` |  |
| metrics.<<.replicaCount | string | `nil` |  |
| goaws.<<.image.pullPolicy | string | `"Always"` |  |
| stream.<<.image.pullPolicy | string | `"Always"` |  |
| reportsgenerator.<<.image.pullPolicy | string | `"Always"` |  |
| vulndbapi.<<.image.pullPolicy | string | `"Always"` |  |
| scanengine.<<.image.pullPolicy | string | `"Always"` |  |
| metrics.<<.image.pullPolicy | string | `"Always"` |  |
| vulndb.<<.image.pullPolicy | string | `"Always"` |  |
| sqsexporter.<<.image.pullPolicy | string | `"Always"` |  |
| tracker.<<.image.pullPolicy | string | `"Always"` |  |
| api.<<.image.pullPolicy | string | `"Always"` |  |
| results.<<.image.pullPolicy | string | `"Always"` |  |
| ui.<<.image.pullPolicy | string | `"Always"` |  |
| persistence.<<.image.pullPolicy | string | `"Always"` |  |
| crontinuous.<<.image.pullPolicy | string | `"Always"` |  |
| insights.<<.image.pullPolicy | string | `"Always"` |  |
| metrics.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| api.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| persistence.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| results.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| vulndb.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| crontinuous.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| ui.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| anchors.comp.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| sqsexporter.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| goaws.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| reportsgenerator.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| vulndbapi.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| insights.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| stream.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| scanengine.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| tracker.<<.meta | object | `{"s3":false,"sns":false,"sqs":false}` | defines the required services for the component |
| reportsgenerator.<<.extraPodLabels | object | `{}` | custom extra labels |
| stream.<<.extraPodLabels | object | `{}` | custom extra labels |
| vulndbapi.<<.extraPodLabels | object | `{}` | custom extra labels |
| goaws.<<.extraPodLabels | object | `{}` | custom extra labels |
| sqsexporter.<<.extraPodLabels | object | `{}` | custom extra labels |
| metrics.<<.extraPodLabels | object | `{}` | custom extra labels |
| vulndb.<<.extraPodLabels | object | `{}` | custom extra labels |
| crontinuous.<<.extraPodLabels | object | `{}` | custom extra labels |
| api.<<.extraPodLabels | object | `{}` | custom extra labels |
| results.<<.extraPodLabels | object | `{}` | custom extra labels |
| anchors.comp.extraPodLabels | object | `{}` | custom extra labels |
| insights.<<.extraPodLabels | object | `{}` | custom extra labels |
| tracker.<<.extraPodLabels | object | `{}` | custom extra labels |
| scanengine.<<.extraPodLabels | object | `{}` | custom extra labels |
| ui.<<.extraPodLabels | object | `{}` | custom extra labels |
| persistence.<<.extraPodLabels | object | `{}` | custom extra labels |
| vulndbapi.<<.extraEnv | object | `{}` | custom env variables |
| anchors.comp.extraEnv | object | `{}` | custom env variables |
| persistence.<<.extraEnv | object | `{}` | custom env variables |
| stream.<<.extraEnv | object | `{}` | custom env variables |
| sqsexporter.<<.extraEnv | object | `{}` | custom env variables |
| metrics.<<.extraEnv | object | `{}` | custom env variables |
| scanengine.<<.extraEnv | object | `{}` | custom env variables |
| insights.<<.extraEnv | object | `{}` | custom env variables |
| tracker.<<.extraEnv | object | `{}` | custom env variables |
| reportsgenerator.<<.extraEnv | object | `{}` | custom env variables |
| api.<<.extraEnv | object | `{}` | custom env variables |
| crontinuous.<<.extraEnv | object | `{}` | custom env variables |
| results.<<.extraEnv | object | `{}` | custom env variables |
| vulndb.<<.extraEnv | object | `{}` | custom env variables |
| goaws.<<.extraEnv | object | `{}` | custom env variables |
| ui.<<.extraEnv | object | `{}` | custom env variables |
| goaws.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| vulndb.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| ui.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| api.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| scanengine.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| tracker.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| vulndbapi.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| sqsexporter.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| metrics.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| reportsgenerator.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| persistence.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| stream.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| anchors.comp.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| insights.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| results.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| crontinuous.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| ui.<<.podSecurityContext | object | `{}` |  |
| goaws.<<.podSecurityContext | object | `{}` |  |
| persistence.<<.podSecurityContext | object | `{}` |  |
| sqsexporter.<<.podSecurityContext | object | `{}` |  |
| stream.<<.podSecurityContext | object | `{}` |  |
| vulndbapi.<<.podSecurityContext | object | `{}` |  |
| results.<<.podSecurityContext | object | `{}` |  |
| crontinuous.<<.podSecurityContext | object | `{}` |  |
| scanengine.<<.podSecurityContext | object | `{}` |  |
| tracker.<<.podSecurityContext | object | `{}` |  |
| api.<<.podSecurityContext | object | `{}` |  |
| reportsgenerator.<<.podSecurityContext | object | `{}` |  |
| insights.<<.podSecurityContext | object | `{}` |  |
| metrics.<<.podSecurityContext | object | `{}` |  |
| vulndb.<<.podSecurityContext | object | `{}` |  |
| insights.<<.securityContext | object | `{}` |  |
| sqsexporter.<<.securityContext | object | `{}` |  |
| crontinuous.<<.securityContext | object | `{}` |  |
| vulndb.<<.securityContext | object | `{}` |  |
| reportsgenerator.<<.securityContext | object | `{}` |  |
| results.<<.securityContext | object | `{}` |  |
| scanengine.<<.securityContext | object | `{}` |  |
| goaws.<<.securityContext | object | `{}` |  |
| persistence.<<.securityContext | object | `{}` |  |
| vulndbapi.<<.securityContext | object | `{}` |  |
| tracker.<<.securityContext | object | `{}` |  |
| stream.<<.securityContext | object | `{}` |  |
| ui.<<.securityContext | object | `{}` |  |
| api.<<.securityContext | object | `{}` |  |
| metrics.<<.securityContext | object | `{}` |  |
| api.<<.imagePullSecrets | list | `[]` |  |
| goaws.<<.imagePullSecrets | list | `[]` |  |
| scanengine.<<.imagePullSecrets | list | `[]` |  |
| ui.<<.imagePullSecrets | list | `[]` |  |
| vulndbapi.<<.imagePullSecrets | list | `[]` |  |
| insights.<<.imagePullSecrets | list | `[]` |  |
| tracker.<<.imagePullSecrets | list | `[]` |  |
| crontinuous.<<.imagePullSecrets | list | `[]` |  |
| sqsexporter.<<.imagePullSecrets | list | `[]` |  |
| vulndb.<<.imagePullSecrets | list | `[]` |  |
| metrics.<<.imagePullSecrets | list | `[]` |  |
| persistence.<<.imagePullSecrets | list | `[]` |  |
| reportsgenerator.<<.imagePullSecrets | list | `[]` |  |
| stream.<<.imagePullSecrets | list | `[]` |  |
| results.<<.imagePullSecrets | list | `[]` |  |
| stream.<<.nameOverride | string | `""` |  |
| goaws.<<.nameOverride | string | `""` |  |
| sqsexporter.<<.nameOverride | string | `""` |  |
| ui.<<.nameOverride | string | `""` |  |
| tracker.<<.nameOverride | string | `""` |  |
| scanengine.<<.nameOverride | string | `""` |  |
| vulndbapi.<<.nameOverride | string | `""` |  |
| insights.<<.nameOverride | string | `""` |  |
| vulndb.<<.nameOverride | string | `""` |  |
| crontinuous.<<.nameOverride | string | `""` |  |
| reportsgenerator.<<.nameOverride | string | `""` |  |
| metrics.<<.nameOverride | string | `""` |  |
| persistence.<<.nameOverride | string | `""` |  |
| results.<<.nameOverride | string | `""` |  |
| api.<<.nameOverride | string | `""` |  |
| vulndb.<<.fullnameOverride | string | `""` |  |
| sqsexporter.<<.fullnameOverride | string | `""` |  |
| metrics.<<.fullnameOverride | string | `""` |  |
| api.<<.fullnameOverride | string | `""` |  |
| vulndbapi.<<.fullnameOverride | string | `""` |  |
| insights.<<.fullnameOverride | string | `""` |  |
| tracker.<<.fullnameOverride | string | `""` |  |
| persistence.<<.fullnameOverride | string | `""` |  |
| scanengine.<<.fullnameOverride | string | `""` |  |
| ui.<<.fullnameOverride | string | `""` |  |
| goaws.<<.fullnameOverride | string | `""` |  |
| results.<<.fullnameOverride | string | `""` |  |
| crontinuous.<<.fullnameOverride | string | `""` |  |
| stream.<<.fullnameOverride | string | `""` |  |
| reportsgenerator.<<.fullnameOverride | string | `""` |  |
| insights.<<.containerPort | int | `8080` |  |
| vulndb.<<.containerPort | int | `8080` |  |
| tracker.<<.containerPort | int | `8080` |  |
| stream.<<.containerPort | int | `8080` |  |
| goaws.<<.containerPort | int | `8080` |  |
| persistence.<<.containerPort | int | `8080` |  |
| ui.<<.containerPort | int | `8080` |  |
| scanengine.<<.containerPort | int | `8080` |  |
| crontinuous.<<.containerPort | int | `8080` |  |
| vulndbapi.<<.containerPort | int | `8080` |  |
| api.<<.containerPort | int | `8080` |  |
| sqsexporter.<<.containerPort | int | `8080` |  |
| results.<<.containerPort | int | `8080` |  |
| reportsgenerator.<<.containerPort | int | `8080` |  |
| metrics.<<.containerPort | int | `8080` |  |
| reportsgenerator.<<.lifecycle.preStopSleep | int | `30` |  |
| metrics.<<.lifecycle.preStopSleep | int | `30` |  |
| api.<<.lifecycle.preStopSleep | int | `30` |  |
| sqsexporter.<<.lifecycle.preStopSleep | int | `30` |  |
| vulndb.<<.lifecycle.preStopSleep | int | `30` |  |
| persistence.<<.lifecycle.preStopSleep | int | `30` |  |
| goaws.<<.lifecycle.preStopSleep | int | `30` |  |
| tracker.<<.lifecycle.preStopSleep | int | `30` |  |
| results.<<.lifecycle.preStopSleep | int | `30` |  |
| ui.<<.lifecycle.preStopSleep | int | `30` |  |
| crontinuous.<<.lifecycle.preStopSleep | int | `30` |  |
| stream.<<.lifecycle.preStopSleep | int | `30` |  |
| vulndbapi.<<.lifecycle.preStopSleep | int | `30` |  |
| insights.<<.lifecycle.preStopSleep | int | `30` |  |
| scanengine.<<.lifecycle.preStopSleep | int | `30` |  |
| crontinuous.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| vulndbapi.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| insights.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| reportsgenerator.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| metrics.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| ui.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| persistence.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| sqsexporter.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| api.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| vulndb.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| goaws.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| results.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| stream.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| anchors.comp.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| scanengine.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| tracker.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| scanengine.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| sqsexporter.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| anchors.comp.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| vulndb.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| stream.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| reportsgenerator.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| tracker.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| results.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| persistence.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| metrics.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| api.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| insights.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| vulndbapi.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| crontinuous.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| ui.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| goaws.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| reportsgenerator.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| ui.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| crontinuous.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| api.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| insights.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| metrics.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| scanengine.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| results.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| tracker.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| goaws.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| vulndb.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| anchors.comp.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| sqsexporter.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| stream.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| vulndbapi.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| persistence.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| ui.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| anchors.comp.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| vulndbapi.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| scanengine.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| metrics.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| reportsgenerator.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| tracker.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| insights.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| persistence.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| goaws.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| crontinuous.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| stream.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| vulndb.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| api.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| sqsexporter.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| results.<<.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| ui.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| sqsexporter.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| vulndb.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| tracker.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| crontinuous.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| api.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| insights.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| stream.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| vulndbapi.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| persistence.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| goaws.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| reportsgenerator.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| scanengine.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| anchors.comp.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| metrics.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| results.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| vulndbapi.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| metrics.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| scanengine.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| tracker.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| vulndb.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| results.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| sqsexporter.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| crontinuous.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| goaws.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| insights.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| stream.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| api.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| persistence.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| anchors.comp.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| reportsgenerator.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| ui.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| tracker.<<.resources | object | `{}` |  |
| results.<<.resources | object | `{}` |  |
| metrics.<<.resources | object | `{}` |  |
| crontinuous.<<.resources | object | `{}` |  |
| scanengine.<<.resources | object | `{}` |  |
| vulndb.<<.resources | object | `{}` |  |
| reportsgenerator.<<.resources | object | `{}` |  |
| sqsexporter.<<.resources | object | `{}` |  |
| ui.<<.resources | object | `{}` |  |
| goaws.<<.resources | object | `{}` |  |
| api.<<.resources | object | `{}` |  |
| persistence.<<.resources | object | `{}` |  |
| insights.<<.resources | object | `{}` |  |
| stream.<<.resources | object | `{}` |  |
| vulndbapi.<<.resources | object | `{}` |  |
| vulndbapi.<<.nodeSelector | object | `{}` |  |
| crontinuous.<<.nodeSelector | object | `{}` |  |
| goaws.<<.nodeSelector | object | `{}` |  |
| scanengine.<<.nodeSelector | object | `{}` |  |
| stream.<<.nodeSelector | object | `{}` |  |
| ui.<<.nodeSelector | object | `{}` |  |
| persistence.<<.nodeSelector | object | `{}` |  |
| sqsexporter.<<.nodeSelector | object | `{}` |  |
| api.<<.nodeSelector | object | `{}` |  |
| results.<<.nodeSelector | object | `{}` |  |
| insights.<<.nodeSelector | object | `{}` |  |
| tracker.<<.nodeSelector | object | `{}` |  |
| reportsgenerator.<<.nodeSelector | object | `{}` |  |
| vulndb.<<.nodeSelector | object | `{}` |  |
| metrics.<<.nodeSelector | object | `{}` |  |
| sqsexporter.<<.tolerations | list | `[]` |  |
| stream.<<.tolerations | list | `[]` |  |
| ui.<<.tolerations | list | `[]` |  |
| vulndb.<<.tolerations | list | `[]` |  |
| results.<<.tolerations | list | `[]` |  |
| api.<<.tolerations | list | `[]` |  |
| reportsgenerator.<<.tolerations | list | `[]` |  |
| persistence.<<.tolerations | list | `[]` |  |
| vulndbapi.<<.tolerations | list | `[]` |  |
| tracker.<<.tolerations | list | `[]` |  |
| goaws.<<.tolerations | list | `[]` |  |
| crontinuous.<<.tolerations | list | `[]` |  |
| insights.<<.tolerations | list | `[]` |  |
| metrics.<<.tolerations | list | `[]` |  |
| scanengine.<<.tolerations | list | `[]` |  |
| vulndbapi.<<.affinity | object | `{}` |  |
| api.<<.affinity | object | `{}` |  |
| crontinuous.<<.affinity | object | `{}` |  |
| reportsgenerator.<<.affinity | object | `{}` |  |
| tracker.<<.affinity | object | `{}` |  |
| persistence.<<.affinity | object | `{}` |  |
| insights.<<.affinity | object | `{}` |  |
| results.<<.affinity | object | `{}` |  |
| stream.<<.affinity | object | `{}` |  |
| metrics.<<.affinity | object | `{}` |  |
| scanengine.<<.affinity | object | `{}` |  |
| sqsexporter.<<.affinity | object | `{}` |  |
| goaws.<<.affinity | object | `{}` |  |
| vulndb.<<.affinity | object | `{}` |  |
| ui.<<.affinity | object | `{}` |  |
| waitfordb.image.repository | string | `"busybox"` |  |
| waitfordb.image.tag | string | `"1.35.0"` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.service.port | int | `5432` |  |
| postgresql.auth.username | string | `"postgres"` |  |
| postgresql.auth.postgresPassword | string | `"secret"` |  |
| postgresql.auth.password | string | `"secret"` |  |
| postgresql.auth.database | string | `"persistence"` |  |
| postgresql.primary.initdb.scripts."initial-dbs.sql" | string | `"CREATE DATABASE api;\nCREATE DATABASE scanengine;\nCREATE DATABASE reportsgenerator;\nCREATE DATABASE vulnerabilitydb;\nCREATE DATABASE tracker;\n"` |  |
| postgresql.primary.resources.requests.cpu | string | `"0"` |  |
| postgresql.primary.resources.requests.memory | string | `"0"` |  |
| postgresql.primary.persistence.enabled | bool | `false` |  |
| postgresql.primary.annotations."prometheus.io/scrape" | string | `"true"` |  |
| postgresql.primary.annotations."prometheus.io/port" | string | `"9187"` |  |
| postgresql.metrics.enabled | bool | `false` |  |
| redis.enabled | bool | `false` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.enabled | bool | `false` |  |
| redis.master.service.ports.redis | int | `6379` |  |
| redis.master.persistence.enabled | bool | `false` |  |
| redis.serviceAccount.create | bool | `false` |  |
| goaws.enabled | bool | `false` |  |
| goaws.name | string | `"goaws"` |  |
| goaws.image.repository | string | `"admiralpiett/goaws"` |  |
| goaws.image.tag | string | `"v0.4.1"` |  |
| goaws.image.pullPolicy | string | `"Always"` |  |
| goaws.containerPort | int | `8080` |  |
| goaws.visibilityTimeout | int | `14400` |  |
| goaws.receiveMessageWaitTimeSeconds | int | `0` |  |
| goaws.config."goaws.yaml" | string | `"Local:\n  Host: {{ include \"goaws.fullname\" . }}\n  Port: {{ .Values.goaws.containerPort }}\n  AccountId: \"012345678900\"\n  LogToFile: false\n  QueueAttributeDefaults:\n    VisibilityTimeout: {{ .Values.goaws.visibilityTimeout }}\n    ReceiveMessageWaitTimeSeconds: {{ .Values.goaws.receiveMessageWaitTimeSeconds }}\n  Queues:\n    - Name: VulcanK8SAPIScans\n    - Name: VulcanK8SMetricsChecks\n    - Name: VulcanK8SMetricsFindings\n    - Name: VulcanK8SMetricsScans\n    - Name: VulcanK8SReportsGenerator\n    - Name: VulcanK8SScanEngineCheckStatus\n    - Name: VulcanK8SV2ChecksGeneric\n    {{- range $value := .Values.scanengine.conf.queues.other }}\n    - Name: {{ regexFind \"[^:]+$\" $value.arn }}\n    {{- end }}\n    - Name: VulcanK8SVulnDBChecks\n  Topics:\n    - Name: VulcanK8SChecks\n      Subscriptions:\n        - QueueName: VulcanK8SMetricsChecks\n          Raw: false\n        - QueueName: VulcanK8SVulnDBChecks\n          Raw: false\n    - Name: VulcanK8SScans\n      Subscriptions:\n        - QueueName: VulcanK8SAPIScans\n          Raw: false\n        - QueueName: VulcanK8SMetricsScans\n          Raw: false\n    - Name: VulcanK8SReportsGen\n      Subscriptions:\n        - QueueName: VulcanK8SReportsGenerator\n          Raw: false\n    - Name: VulcanK8SVulnDBVulns\n      Subscriptions:\n        - QueueName: VulcanK8SMetricsFindings\n          Raw: false\n  RandomLatency:\n    Min: 0\n    Max: 0\n"` |  |
| minio.enabled | bool | `false` |  |
| minio.nameOverride | string | `"minio"` |  |
| minio.mode | string | `"standalone"` |  |
| minio.defaultBuckets | string | `"reports,logs,scans,insights,public-insights,crontinuous"` |  |
| minio.serviceAccount.create | bool | `false` |  |
| minio.persistence.enabled | bool | `false` |  |
| minio.service.ports.api | int | `80` |  |
| minio.auth.rootUser | string | `"admin"` |  |
| minio.auth.rootPassword | string | `"adminsecret"` |  |
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
| results.conf.linkBase | string | `"http://vulcan-results"` |  |
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
| api.conf.vulcantrackerUrl | string | `nil` |  |
| api.conf.vulcantrackerTeams | string | `"team1,team2"` |  |
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
| api.conf.kafka.broker | string | `nil` |  |
| api.conf.kafka.username | string | `nil` |  |
| api.conf.kafka.password | string | `nil` |  |
| api.conf.kafka.topics | string | `nil` |  |
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
| insights.proxy | object | `{"<<":{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.4.23-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null},"cache":{"enabled":true},"enabled":true}` | proxy settings. mandatory for insights |
| insights.conf.region | string | `nil` |  |
| insights.conf.log | string | `"false"` |  |
| insights.conf.private.name | string | `"private"` |  |
| insights.conf.private.s3Bucket | string | `"insights"` |  |
| insights.conf.private.prefix | string | `""` |  |
| insights.conf.public.name | string | `"public"` |  |
| insights.conf.public.s3Bucket | string | `"public-insights"` |  |
| insights.conf.public.prefix | string | `"/public"` |  |
| insights.meta.s3 | bool | `true` |  |
| reportsgenerator.enabled | bool | `true` |  |
| reportsgenerator.name | string | `"reportsgenerator"` |  |
| reportsgenerator.image.repository | string | `"adevinta/vulcan-reports-generator"` |  |
| reportsgenerator.image.tag | string | `"1.0"` |  |
| reportsgenerator.image.pullPolicy | string | `"Always"` |  |
| reportsgenerator.healthcheckPath | string | `"/healthcheck"` |  |
| reportsgenerator.meta.sqs | bool | `true` |  |
| reportsgenerator.meta.s3 | bool | `true` |  |
| reportsgenerator.conf.logLevel | string | `"error"` |  |
| reportsgenerator.conf.queueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SReportsGenerator"` |  |
| reportsgenerator.conf.queueName | string | `"VulcanK8SReportsGenerator"` |  |
| reportsgenerator.conf.sqsNumProcessors | string | `nil` |  |
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
| tracker.enabled | bool | `true` |  |
| tracker.name | string | `"tracker"` |  |
| tracker.image.repository | string | `"adevinta/vulcan-tracker"` |  |
| tracker.image.tag | string | `"edge"` |  |
| tracker.image.pullPolicy | string | `"Always"` |  |
| tracker.healthcheckPath | string | `"/healthcheck"` |  |
| tracker.conf.logLevel | string | `"error"` |  |
| tracker.conf.awsServerCredentialKey | string | `"/path/to/credentials/"` |  |
| tracker.conf.region | string | `nil` |  |
| tracker.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"name":"tracker"}` | postgres database settings |
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
| metrics.redis.image | string | `"bitnami/redis:6.2.12"` |  |
| metrics.meta.sqs | bool | `true` |  |
| vulndbapi.enabled | bool | `true` |  |
| vulndbapi.name | string | `"vulndbapi"` |  |
| vulndbapi.image.repository | string | `"adevinta/vulnerability-db-api"` |  |
| vulndbapi.image.tag | string | `"1.0"` |  |
| vulndbapi.image.pullPolicy | string | `"Always"` |  |
| vulndbapi.healthcheckPath | string | `"/healthcheck"` |  |
| vulndbapi.conf.logLevel | string | `"info"` |  |
| vulndbapi.conf.readReplicaHost | string | `""` |  |
| vulndbapi.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"name":"vulnerabilitydb"}` | postgres database settings |
| vulndb.enabled | bool | `true` |  |
| vulndb.name | string | `"vulndb"` |  |
| vulndb.image.repository | string | `"adevinta/vulnerability-db"` |  |
| vulndb.image.tag | string | `"1.0"` |  |
| vulndb.image.pullPolicy | string | `"Always"` |  |
| vulndb.conf.logLevel | string | `"error"` |  |
| vulndb.conf.checksQueueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SVulnDBChecks"` |  |
| vulndb.conf.vulnsTopicArn | string | `"arn:aws:sns:local:012345678900:VulcanK8SVulnDBVulns"` |  |
| vulndb.conf.sqsNumProcessors | string | `nil` |  |
| vulndb.conf.vulnsTopicEnabled | bool | `true` |  |
| vulndb.conf.maxEventAge | int | `365` |  |
| vulndb.conf.resultsUrl | string | `"http://vulcan-results.vulcan.com"` |  |
| vulndb.conf.resultsInternalUrl | string | `nil` |  |
| vulndb.conf.kafka.enabled | bool | `false` |  |
| vulndb.conf.kafka.username | string | `nil` |  |
| vulndb.conf.kafka.password | string | `nil` |  |
| vulndb.conf.kafka.broker | string | `nil` |  |
| vulndb.conf.kafka.topic | string | `nil` |  |
| vulndb.proxy.enabled | bool | `false` |  |
| vulndb.meta.sqs | bool | `true` |  |
| vulndb.meta.sns | bool | `true` |  |
| vulndb.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":5432,"sslMode":"disable","user":null},"name":"vulnerabilitydb"}` | postgres database settings |
| sqsexporter.enabled | bool | `true` |  |
| sqsexporter.name | string | `"sqsexporter"` |  |
| sqsexporter.image.repository | string | `"jesusfcr/sqs-prometheus-exporter"` |  |
| sqsexporter.image.tag | string | `"0.4.0"` |  |
| sqsexporter.image.pullPolicy | string | `"Always"` |  |
| sqsexporter.proxy.enabled | bool | `false` |  |
| sqsexporter.queueNamePrefix | string | `"VulcanK8S"` |  |
| sqsexporter.meta.sqs | bool | `true` |  |
| dogstatsd.name | string | `"dogstatsd"` |  |
| dogstatsd.apiKey | string | `"TBD"` |  |
| extraManifests | object | `{}` | Allows to inject custom manifests that would be processed as templates |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
