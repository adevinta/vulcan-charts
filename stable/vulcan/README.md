# vulcan

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for deploying Vulcan

**Homepage:** <https://github.com/adevinta/vulcan-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | minio | 3.3.6 |
| https://charts.bitnami.com/bitnami | postgresql | 8.9.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.domain | string | `"vulcan.local"` |  |
| global.region | string | `"local"` |  |
| anchors | object | `{"comp":{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null},"containerPort":8080,"extraEnv":{},"fullnameOverride":"","image":{"pullPolicy":"Always"},"imagePullSecrets":[],"ingress":{"annotations":{},"enabled":false,"hosts":[],"tls":[]},"lifecycle":{"preStopSleep":30},"livenessProbe":{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3},"nameOverride":"","nodeSelector":{},"podSecurityContext":{},"proxy":{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null},"readinessProbe":{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3},"replicaCount":null,"resources":{},"securityContext":{},"service":{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"},"tolerations":[]},"db":{"ca":null,"host":null,"name":null,"password":"TBD","port":null,"sslMode":"disable","user":"postgres"},"dogstatsd":{"enabled":true,"image":{"repository":"datadog/dogstatsd","tag":"7.27.0"}}}` | Anchors |
| anchors.db | object | `{"ca":null,"host":null,"name":null,"password":"TBD","port":null,"sslMode":"disable","user":"postgres"}` | postgres database settings |
| anchors.comp.extraEnv | object | `{}` | custom env variables |
| anchors.comp.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| anchors.comp.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| anchors.comp.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| anchors.comp.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| anchors.comp.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| anchors.comp.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| anchors.comp.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| waitfordb.image.repository | string | `"postgres"` |  |
| waitfordb.image.tag | string | `"9.6-alpine"` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.postgresqlUsername | string | `"postgres"` |  |
| postgresql.postgresqlPassword | string | `"TBD"` |  |
| postgresql.postgresqlDatabase | string | `"persistence"` |  |
| postgresql.initdbScripts."initial-dbs.sql" | string | `"CREATE DATABASE api;\nCREATE DATABASE scanengine;\nCREATE DATABASE reportsgenerator;\nCREATE DATABASE vulnerabilitydb;\n"` |  |
| postgresql.master.annotations."prometheus.io/scrape" | string | `"true"` |  |
| postgresql.master.annotations."prometheus.io/port" | string | `"9187"` |  |
| postgresql.resources.requests.cpu | string | `"0"` |  |
| postgresql.resources.requests.memory | string | `"0"` |  |
| postgresql.persistence.enabled | bool | `false` |  |
| postgresql.metrics.enabled | bool | `true` |  |
| goaws.enabled | bool | `false` |  |
| goaws.name | string | `"goaws"` |  |
| goaws.<<.replicaCount | string | `nil` |  |
| goaws.<<.image.pullPolicy | string | `"Always"` |  |
| goaws.<<.extraEnv | object | `{}` | custom env variables |
| goaws.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| goaws.<<.podSecurityContext | object | `{}` |  |
| goaws.<<.securityContext | object | `{}` |  |
| goaws.<<.imagePullSecrets | list | `[]` |  |
| goaws.<<.nameOverride | string | `""` |  |
| goaws.<<.fullnameOverride | string | `""` |  |
| goaws.<<.containerPort | int | `8080` |  |
| goaws.<<.lifecycle.preStopSleep | int | `30` |  |
| goaws.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| goaws.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| goaws.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| goaws.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| goaws.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| goaws.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| goaws.<<.resources | object | `{}` |  |
| goaws.<<.nodeSelector | object | `{}` |  |
| goaws.<<.tolerations | list | `[]` |  |
| goaws.<<.affinity | object | `{}` |  |
| goaws.image.repository | string | `"pafortin/goaws"` |  |
| goaws.image.tag | string | `"v0.3.1"` |  |
| goaws.image.pullPolicy | string | `"Always"` |  |
| goaws.containerPort | int | `8080` |  |
| goaws.config."goaws.yaml" | string | `"Local:\n  Host: {{ .Release.Name }}-goaws\n  Port: {{ .Values.containerPort }}\n  AccountId: \"012345678900\"\n  LogToFile: false\n  QueueAttributeDefaults:\n    VisibilityTimeout: 30\n    ReceiveMessageWaitTimeSeconds: 0\n  Queues:\n    - Name: VulcanK8SAPIScans\n    - Name: VulcanK8SChecksGeneric\n    - Name: VulcanK8SChecksTenable\n    - Name: VulcanK8SMetricsChecks\n    - Name: VulcanK8SMetricsScans\n    - Name: VulcanK8SMetricsFindings\n    - Name: VulcanK8SScanEngineChecks\n    - Name: VulcanK8SReportsGenerator\n    - Name: VulcanK8SPersistenceChecks\n    - Name: VulcanK8SVulnDBChecks\n  Topics:\n    - Name: VulcanK8SChecks\n      Subscriptions:\n        - QueueName: VulcanK8SMetricsChecks\n          Raw: true\n        - QueueName: VulcanK8SScanEngineChecks\n          Raw: true\n          #FilterPolicy: '{\"foo\": [\"bar\"]}'\n    - Name: VulcanK8SScans\n      Subscriptions:\n        - QueueName: VulcanK8SAPIScans\n          Raw: true\n        - QueueName: VulcanK8SMetricsScans\n          Raw: true\n    - Name: VulcanK8SReportsGen\n      Subscriptions:\n        - QueueName: VulcanK8SReportsGenerator\n          Raw: true\n    - Name: VulcanK8SScanEngineChecks\n      Subscriptions:\n        - QueueName: VulcanK8SPersistenceChecks\n          Raw: true\n    - Name: VulcanK8SVulnDBVulns\n        - QueueName: VulcanK8SMetricsFindings\n          Raw: true\n  RandomLatency:\n    Min: 0\n    Max: 0\n"` |  |
| minio.enabled | bool | `false` |  |
| minio.nameOverride | string | `"vulcans3"` |  |
| minio.mode | string | `"standalone"` |  |
| minio.defaultBuckets | string | `"reports,logs,scans,insights,public-insights,crontinuous"` |  |
| minio.serviceAccount.create | bool | `false` |  |
| minio.persistence.enabled | bool | `false` |  |
| minio.service.port | int | `80` |  |
| minio.service.type | string | `"NodePort"` |  |
| minio.accessKey.password | string | `"AKIAIOSFODNN7EXAMPLE"` |  |
| minio.secretKey.password | string | `"wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"` |  |
| minio.extraEnv[0].name | string | `"MINIO_REGION_NAME"` |  |
| minio.extraEnv[0].value | string | `"local"` |  |
| results.enabled | bool | `true` |  |
| results.name | string | `"results"` |  |
| results.<<.replicaCount | string | `nil` |  |
| results.<<.image.pullPolicy | string | `"Always"` |  |
| results.<<.extraEnv | object | `{}` | custom env variables |
| results.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| results.<<.podSecurityContext | object | `{}` |  |
| results.<<.securityContext | object | `{}` |  |
| results.<<.imagePullSecrets | list | `[]` |  |
| results.<<.nameOverride | string | `""` |  |
| results.<<.fullnameOverride | string | `""` |  |
| results.<<.containerPort | int | `8080` |  |
| results.<<.lifecycle.preStopSleep | int | `30` |  |
| results.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| results.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| results.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| results.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| results.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| results.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| results.<<.resources | object | `{}` |  |
| results.<<.nodeSelector | object | `{}` |  |
| results.<<.tolerations | list | `[]` |  |
| results.<<.affinity | object | `{}` |  |
| results.image.repository | string | `"adevinta/vulcan-results"` |  |
| results.image.tag | string | `"latest"` |  |
| results.image.pullPolicy | string | `"Always"` |  |
| results.conf.debug | string | `"false"` |  |
| results.conf.region | string | `nil` |  |
| results.conf.bucketReports | string | `"reports"` |  |
| results.conf.bucketLogs | string | `"logs"` |  |
| results.conf.linkBase | string | `"http://chart-example.local"` |  |
| results.healthcheckPath | string | `"/healthcheck"` |  |
| results.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| results.dogstatsd.image.tag | string | `"7.27.0"` |  |
| results.dogstatsd.enabled | bool | `true` |  |
| results.infra.s3 | bool | `true` |  |
| persistence.enabled | bool | `true` |  |
| persistence.name | string | `"persistence"` |  |
| persistence.<<.replicaCount | string | `nil` |  |
| persistence.<<.image.pullPolicy | string | `"Always"` |  |
| persistence.<<.extraEnv | object | `{}` | custom env variables |
| persistence.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| persistence.<<.podSecurityContext | object | `{}` |  |
| persistence.<<.securityContext | object | `{}` |  |
| persistence.<<.imagePullSecrets | list | `[]` |  |
| persistence.<<.nameOverride | string | `""` |  |
| persistence.<<.fullnameOverride | string | `""` |  |
| persistence.<<.containerPort | int | `8080` |  |
| persistence.<<.lifecycle.preStopSleep | int | `30` |  |
| persistence.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| persistence.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| persistence.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| persistence.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| persistence.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| persistence.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| persistence.<<.resources | object | `{}` |  |
| persistence.<<.nodeSelector | object | `{}` |  |
| persistence.<<.tolerations | list | `[]` |  |
| persistence.<<.affinity | object | `{}` |  |
| persistence.image.repository | string | `"adevinta/vulcan-persistence"` |  |
| persistence.image.tag | string | `"latest"` |  |
| persistence.image.pullPolicy | string | `"Always"` |  |
| persistence.healthcheckPath | string | `"/status"` |  |
| persistence.infra.s3 | bool | `true` |  |
| persistence.infra.sns | bool | `true` |  |
| persistence.infra.sqs | bool | `true` |  |
| persistence.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":null,"sslMode":"disable","user":"postgres"},"name":"persistence"}` | postgres database settings |
| persistence.conf.logLevel | string | `"warn"` |  |
| persistence.conf.secretKeyBase | string | `"TBDTBD"` |  |
| persistence.conf.railsMaxThreads | int | `4` |  |
| persistence.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| persistence.dogstatsd.image.tag | string | `"7.27.0"` |  |
| persistence.dogstatsd.enabled | bool | `true` |  |
| stream.enabled | bool | `true` |  |
| stream.name | string | `"stream"` |  |
| stream.<<.replicaCount | string | `nil` |  |
| stream.<<.image.pullPolicy | string | `"Always"` |  |
| stream.<<.extraEnv | object | `{}` | custom env variables |
| stream.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| stream.<<.podSecurityContext | object | `{}` |  |
| stream.<<.securityContext | object | `{}` |  |
| stream.<<.imagePullSecrets | list | `[]` |  |
| stream.<<.nameOverride | string | `""` |  |
| stream.<<.fullnameOverride | string | `""` |  |
| stream.<<.containerPort | int | `8080` |  |
| stream.<<.lifecycle.preStopSleep | int | `30` |  |
| stream.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| stream.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| stream.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| stream.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| stream.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| stream.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| stream.<<.resources | object | `{}` |  |
| stream.<<.nodeSelector | object | `{}` |  |
| stream.<<.tolerations | list | `[]` |  |
| stream.<<.affinity | object | `{}` |  |
| stream.image.repository | string | `"adevinta/vulcan-stream"` |  |
| stream.image.tag | string | `"latest"` |  |
| stream.image.pullPolicy | string | `"Always"` |  |
| stream.healthcheckPath | string | `"/status"` |  |
| stream.conf.logLevel | string | `"DEBUG"` |  |
| stream.conf.redis.host | string | `"TBD"` |  |
| stream.conf.redis.port | string | `"TDB"` |  |
| stream.conf.redis.usr | string | `"TBD"` |  |
| stream.conf.redis.pwd | string | `"TBD"` |  |
| stream.conf.redis.db | int | `0` |  |
| stream.conf.redis.ttl | int | `0` |  |
| stream.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| stream.dogstatsd.image.tag | string | `"7.27.0"` |  |
| stream.dogstatsd.enabled | bool | `true` |  |
| api.enabled | bool | `true` |  |
| api.name | string | `"api"` |  |
| api.<<.replicaCount | string | `nil` |  |
| api.<<.image.pullPolicy | string | `"Always"` |  |
| api.<<.extraEnv | object | `{}` | custom env variables |
| api.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| api.<<.podSecurityContext | object | `{}` |  |
| api.<<.securityContext | object | `{}` |  |
| api.<<.imagePullSecrets | list | `[]` |  |
| api.<<.nameOverride | string | `""` |  |
| api.<<.fullnameOverride | string | `""` |  |
| api.<<.containerPort | int | `8080` |  |
| api.<<.lifecycle.preStopSleep | int | `30` |  |
| api.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| api.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| api.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| api.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| api.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| api.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| api.<<.resources | object | `{}` |  |
| api.<<.nodeSelector | object | `{}` |  |
| api.<<.tolerations | list | `[]` |  |
| api.<<.affinity | object | `{}` |  |
| api.image.repository | string | `"adevinta/vulcan-api"` |  |
| api.image.tag | string | `"latest"` |  |
| api.image.pullPolicy | string | `"Always"` |  |
| api.infra.sqs | bool | `true` |  |
| api.infra.sns | bool | `true` |  |
| api.infra.s3 | bool | `true` |  |
| api.healthcheckPath | string | `"/api/v1/healthcheck"` |  |
| api.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":null,"sslMode":"disable","user":"postgres"},"name":"api"}` | postgres database settings |
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
| api.conf.log.level | string | `"INFO"` |  |
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
| api.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| api.dogstatsd.image.tag | string | `"7.27.0"` |  |
| api.dogstatsd.enabled | bool | `true` |  |
| api.ingress.path | string | `"/api"` |  |
| crontinuous.enabled | bool | `true` |  |
| crontinuous.name | string | `"crontinuous"` |  |
| crontinuous.<<.replicaCount | string | `nil` |  |
| crontinuous.<<.image.pullPolicy | string | `"Always"` |  |
| crontinuous.<<.extraEnv | object | `{}` | custom env variables |
| crontinuous.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| crontinuous.<<.podSecurityContext | object | `{}` |  |
| crontinuous.<<.securityContext | object | `{}` |  |
| crontinuous.<<.imagePullSecrets | list | `[]` |  |
| crontinuous.<<.nameOverride | string | `""` |  |
| crontinuous.<<.fullnameOverride | string | `""` |  |
| crontinuous.<<.containerPort | int | `8080` |  |
| crontinuous.<<.lifecycle.preStopSleep | int | `30` |  |
| crontinuous.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| crontinuous.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| crontinuous.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| crontinuous.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| crontinuous.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| crontinuous.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| crontinuous.<<.resources | object | `{}` |  |
| crontinuous.<<.nodeSelector | object | `{}` |  |
| crontinuous.<<.tolerations | list | `[]` |  |
| crontinuous.<<.affinity | object | `{}` |  |
| crontinuous.image.repository | string | `"adevinta/vulcan-crontinuous"` |  |
| crontinuous.image.tag | string | `"latest"` |  |
| crontinuous.image.pullPolicy | string | `"Always"` |  |
| crontinuous.infra.s3 | bool | `true` |  |
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
| scanengine.<<.replicaCount | string | `nil` |  |
| scanengine.<<.image.pullPolicy | string | `"Always"` |  |
| scanengine.<<.extraEnv | object | `{}` | custom env variables |
| scanengine.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| scanengine.<<.podSecurityContext | object | `{}` |  |
| scanengine.<<.securityContext | object | `{}` |  |
| scanengine.<<.imagePullSecrets | list | `[]` |  |
| scanengine.<<.nameOverride | string | `""` |  |
| scanengine.<<.fullnameOverride | string | `""` |  |
| scanengine.<<.containerPort | int | `8080` |  |
| scanengine.<<.lifecycle.preStopSleep | int | `30` |  |
| scanengine.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| scanengine.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| scanengine.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| scanengine.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| scanengine.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| scanengine.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| scanengine.<<.resources | object | `{}` |  |
| scanengine.<<.nodeSelector | object | `{}` |  |
| scanengine.<<.tolerations | list | `[]` |  |
| scanengine.<<.affinity | object | `{}` |  |
| scanengine.image.repository | string | `"adevinta/vulcan-scan-engine"` |  |
| scanengine.image.tag | string | `"latest"` |  |
| scanengine.image.pullPolicy | string | `"Always"` |  |
| scanengine.healthcheckPath | string | `"/v1/healthcheck"` |  |
| scanengine.infra.sqs | bool | `true` |  |
| scanengine.infra.sns | bool | `true` |  |
| scanengine.conf.logLevel | string | `"error"` |  |
| scanengine.conf.queueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SScanEngineChecks"` |  |
| scanengine.conf.queueName | string | `"VulcanK8SScanEngineChecks"` |  |
| scanengine.conf.scansSNS.topicArn | string | `"arn:aws:sns:local:012345678900:VulcanK8SScans"` |  |
| scanengine.conf.checksSNS.topicArn | string | `"arn:aws:sns:eu-west-1:012345678900:VulcanK8SScanEngineChecks"` |  |
| scanengine.conf.queues.default.arn | string | `"VulcanK8SChecksGeneric"` |  |
| scanengine.conf.queues.nessus.arn | string | `"VulcanK8SChecksTenable"` |  |
| scanengine.conf.queues.nessus.checktypes | string | `"[\"vulcan-nessus\"]"` |  |
| scanengine.conf.persistenceHost | string | `nil` |  |
| scanengine.conf.streamUrl | string | `nil` |  |
| scanengine.conf.checkCreator.numOfWorkers | int | `2` |  |
| scanengine.conf.checkCreator.period | int | `20` |  |
| scanengine.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":null,"sslMode":"disable","user":"postgres"},"name":"scanengine"}` | postgres database settings |
| scanengine.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| scanengine.dogstatsd.image.tag | string | `"7.27.0"` |  |
| scanengine.dogstatsd.enabled | bool | `true` |  |
| ui.enabled | bool | `true` |  |
| ui.name | string | `"ui"` |  |
| ui.<<.replicaCount | string | `nil` |  |
| ui.<<.image.pullPolicy | string | `"Always"` |  |
| ui.<<.extraEnv | object | `{}` | custom env variables |
| ui.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| ui.<<.podSecurityContext | object | `{}` |  |
| ui.<<.securityContext | object | `{}` |  |
| ui.<<.imagePullSecrets | list | `[]` |  |
| ui.<<.nameOverride | string | `""` |  |
| ui.<<.fullnameOverride | string | `""` |  |
| ui.<<.containerPort | int | `8080` |  |
| ui.<<.lifecycle.preStopSleep | int | `30` |  |
| ui.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| ui.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| ui.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| ui.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| ui.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| ui.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| ui.<<.resources | object | `{}` |  |
| ui.<<.nodeSelector | object | `{}` |  |
| ui.<<.tolerations | list | `[]` |  |
| ui.<<.affinity | object | `{}` |  |
| ui.image.repository | string | `"adevinta/vulcan-ui"` |  |
| ui.image.tag | string | `"latest"` |  |
| ui.image.pullPolicy | string | `"Always"` |  |
| ui.healthcheckPath | string | `"/index.html"` |  |
| ui.infra.sqs | bool | `false` |  |
| ui.conf.apiUrl | string | `nil` |  |
| ui.conf.docs.apiLink | string | `nil` |  |
| ui.conf.docs.whitelistingLink | string | `nil` |  |
| ui.conf.docs.discoveryLink | string | `nil` |  |
| ui.conf.docs.auditRoleLink | string | `nil` |  |
| ui.conf.contact.email | string | `nil` |  |
| ui.conf.contact.slack | string | `nil` |  |
| insights.enabled | bool | `true` |  |
| insights.name | string | `"insights"` |  |
| insights.<<.replicaCount | string | `nil` |  |
| insights.<<.image.pullPolicy | string | `"Always"` |  |
| insights.<<.extraEnv | object | `{}` | custom env variables |
| insights.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| insights.<<.podSecurityContext | object | `{}` |  |
| insights.<<.securityContext | object | `{}` |  |
| insights.<<.imagePullSecrets | list | `[]` |  |
| insights.<<.nameOverride | string | `""` |  |
| insights.<<.fullnameOverride | string | `""` |  |
| insights.<<.containerPort | int | `8080` |  |
| insights.<<.lifecycle.preStopSleep | int | `30` |  |
| insights.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| insights.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| insights.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| insights.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| insights.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| insights.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| insights.<<.resources | object | `{}` |  |
| insights.<<.nodeSelector | object | `{}` |  |
| insights.<<.tolerations | list | `[]` |  |
| insights.<<.affinity | object | `{}` |  |
| insights.image.repository | string | `"pottava/s3-proxy"` |  |
| insights.image.tag | string | `"2.0"` |  |
| insights.image.pullPolicy | string | `"Always"` |  |
| insights.healthcheckPath | string | `"/healthcheck"` |  |
| insights.proxy | object | `{"<<":{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null},"cache":{"enabled":true},"enabled":true}` | proxy settings. mandatory for insights |
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
| reportsgenerator.<<.replicaCount | string | `nil` |  |
| reportsgenerator.<<.image.pullPolicy | string | `"Always"` |  |
| reportsgenerator.<<.extraEnv | object | `{}` | custom env variables |
| reportsgenerator.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| reportsgenerator.<<.podSecurityContext | object | `{}` |  |
| reportsgenerator.<<.securityContext | object | `{}` |  |
| reportsgenerator.<<.imagePullSecrets | list | `[]` |  |
| reportsgenerator.<<.nameOverride | string | `""` |  |
| reportsgenerator.<<.fullnameOverride | string | `""` |  |
| reportsgenerator.<<.containerPort | int | `8080` |  |
| reportsgenerator.<<.lifecycle.preStopSleep | int | `30` |  |
| reportsgenerator.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| reportsgenerator.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| reportsgenerator.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| reportsgenerator.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| reportsgenerator.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| reportsgenerator.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| reportsgenerator.<<.resources | object | `{}` |  |
| reportsgenerator.<<.nodeSelector | object | `{}` |  |
| reportsgenerator.<<.tolerations | list | `[]` |  |
| reportsgenerator.<<.affinity | object | `{}` |  |
| reportsgenerator.image.repository | string | `"adevinta/vulcan-reports-generator"` |  |
| reportsgenerator.image.tag | string | `"latest"` |  |
| reportsgenerator.image.pullPolicy | string | `"Always"` |  |
| reportsgenerator.healthcheckPath | string | `"/healthcheck"` |  |
| reportsgenerator.infra.sqs | bool | `true` |  |
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
| reportsgenerator.conf.generators.scan.contact.companyName | string | `nil` |  |
| reportsgenerator.conf.generators.scan.contact.supportEmail | string | `nil` |  |
| reportsgenerator.conf.generators.scan.contact.email | string | `nil` |  |
| reportsgenerator.conf.generators.scan.contact.slackChannel | string | `nil` |  |
| reportsgenerator.conf.generators.scan.contact.jira | string | `nil` |  |
| reportsgenerator.conf.generators.scan.docs.apiDocLink | string | `nil` |  |
| reportsgenerator.conf.generators.scan.docs.roadmapLink | string | `nil` |  |
| reportsgenerator.conf.generators.scan.vulcanUi | string | `nil` |  |
| reportsgenerator.conf.generators.scan.viewReport | string | `nil` |  |
| reportsgenerator.conf.generators.scan.redirectUrl | string | `nil` |  |
| reportsgenerator.conf.generators.livereport.emailSubject | string | `nil` |  |
| reportsgenerator.conf.ses.region | string | `nil` |  |
| reportsgenerator.conf.ses.from | string | `"tbd@tbd.com"` |  |
| reportsgenerator.conf.ses.cc | string | `"[\"tbd@tbd.com\"]"` |  |
| reportsgenerator.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":null,"sslMode":"disable","user":"postgres"},"name":"reportsgenerator"}` | postgres database settings |
| reportsgenerator.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| reportsgenerator.dogstatsd.image.tag | string | `"7.27.0"` |  |
| reportsgenerator.dogstatsd.enabled | bool | `true` |  |
| redis.enabled | bool | `true` |  |
| redis.name | string | `"redis"` |  |
| redis.<<.replicaCount | string | `nil` |  |
| redis.<<.image.pullPolicy | string | `"Always"` |  |
| redis.<<.extraEnv | object | `{}` | custom env variables |
| redis.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| redis.<<.podSecurityContext | object | `{}` |  |
| redis.<<.securityContext | object | `{}` |  |
| redis.<<.imagePullSecrets | list | `[]` |  |
| redis.<<.nameOverride | string | `""` |  |
| redis.<<.fullnameOverride | string | `""` |  |
| redis.<<.containerPort | int | `8080` |  |
| redis.<<.lifecycle.preStopSleep | int | `30` |  |
| redis.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| redis.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| redis.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| redis.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| redis.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| redis.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| redis.<<.resources | object | `{}` |  |
| redis.<<.nodeSelector | object | `{}` |  |
| redis.<<.tolerations | list | `[]` |  |
| redis.<<.affinity | object | `{}` |  |
| redis.image.repository | string | `"bitnami/redis"` |  |
| redis.image.tag | string | `"6.0.12"` |  |
| redis.image.pullPolicy | string | `"Always"` |  |
| redis.containerPort | int | `6379` |  |
| redis.conf.redisPassword | string | `"TBD"` |  |
| redis.service.type | string | `"ClusterIP"` |  |
| redis.service.port | int | `6379` |  |
| redis.service.protocol | string | `"TCP"` |  |
| redis.service.targetPort | int | `6379` |  |
| redis.service.portName | string | `"redis"` |  |
| metrics.enabled | bool | `true` |  |
| metrics.name | string | `"metrics"` |  |
| metrics.<<.replicaCount | string | `nil` |  |
| metrics.<<.image.pullPolicy | string | `"Always"` |  |
| metrics.<<.extraEnv | object | `{}` | custom env variables |
| metrics.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| metrics.<<.podSecurityContext | object | `{}` |  |
| metrics.<<.securityContext | object | `{}` |  |
| metrics.<<.imagePullSecrets | list | `[]` |  |
| metrics.<<.nameOverride | string | `""` |  |
| metrics.<<.fullnameOverride | string | `""` |  |
| metrics.<<.containerPort | int | `8080` |  |
| metrics.<<.lifecycle.preStopSleep | int | `30` |  |
| metrics.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| metrics.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| metrics.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| metrics.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| metrics.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| metrics.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| metrics.<<.resources | object | `{}` |  |
| metrics.<<.nodeSelector | object | `{}` |  |
| metrics.<<.tolerations | list | `[]` |  |
| metrics.<<.affinity | object | `{}` |  |
| metrics.image.repository | string | `"containers.mpi-internal.com/spt-security/vulcan-metrics"` |  |
| metrics.image.tag | string | `"latest"` |  |
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
| metrics.conf.redisAddr | string | `nil` |  |
| metrics.conf.redisPassword | string | `nil` |  |
| metrics.conf.resultsHost | string | `nil` |  |
| metrics.conf.vulcanApi | string | `nil` |  |
| metrics.conf.vulcanAPIToken | string | `"token"` |  |
| metrics.conf.vulcanAPIExternal | string | `nil` |  |
| metrics.infra.sqs | bool | `true` |  |
| metrics.dogstatsd.image.repository | string | `"datadog/dogstatsd"` |  |
| metrics.dogstatsd.image.tag | string | `"7.27.0"` |  |
| metrics.dogstatsd.enabled | bool | `true` |  |
| vulndbapi.enabled | bool | `true` |  |
| vulndbapi.name | string | `"vulndbapi"` |  |
| vulndbapi.<<.replicaCount | string | `nil` |  |
| vulndbapi.<<.image.pullPolicy | string | `"Always"` |  |
| vulndbapi.<<.extraEnv | object | `{}` | custom env variables |
| vulndbapi.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| vulndbapi.<<.podSecurityContext | object | `{}` |  |
| vulndbapi.<<.securityContext | object | `{}` |  |
| vulndbapi.<<.imagePullSecrets | list | `[]` |  |
| vulndbapi.<<.nameOverride | string | `""` |  |
| vulndbapi.<<.fullnameOverride | string | `""` |  |
| vulndbapi.<<.containerPort | int | `8080` |  |
| vulndbapi.<<.lifecycle.preStopSleep | int | `30` |  |
| vulndbapi.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| vulndbapi.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| vulndbapi.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| vulndbapi.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| vulndbapi.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| vulndbapi.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| vulndbapi.<<.resources | object | `{}` |  |
| vulndbapi.<<.nodeSelector | object | `{}` |  |
| vulndbapi.<<.tolerations | list | `[]` |  |
| vulndbapi.<<.affinity | object | `{}` |  |
| vulndbapi.image.repository | string | `"adevinta/vulnerability-db-api"` |  |
| vulndbapi.image.tag | string | `"latest"` |  |
| vulndbapi.image.pullPolicy | string | `"Always"` |  |
| vulndbapi.healthcheckPath | string | `"/healthcheck"` |  |
| vulndbapi.conf.logLevel | string | `"info"` |  |
| vulndbapi.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":null,"sslMode":"disable","user":"postgres"},"name":"vulnerabilitydb"}` | postgres database settings |
| vulndb.enabled | bool | `true` |  |
| vulndb.name | string | `"vulndb"` |  |
| vulndb.<<.replicaCount | string | `nil` |  |
| vulndb.<<.image.pullPolicy | string | `"Always"` |  |
| vulndb.<<.extraEnv | object | `{}` | custom env variables |
| vulndb.<<.proxy | object | `{"cache":{"enabled":false,"maxAge":240,"maxSize":64},"enabled":true,"image":{"repository":"haproxy","tag":"2.3-alpine"},"lifecycle":{"preStopSleep":30},"metricsPort":9101,"port":9090,"probe":false,"probeInitialDelay":5,"probePath":"/healthz","probeTimeoutSeconds":3,"resources":{},"timeoutClient":null,"timeoutConnect":null,"timeoutServer":null,"timeoutTunnel":null}` | proxy settings |
| vulndb.<<.podSecurityContext | object | `{}` |  |
| vulndb.<<.securityContext | object | `{}` |  |
| vulndb.<<.imagePullSecrets | list | `[]` |  |
| vulndb.<<.nameOverride | string | `""` |  |
| vulndb.<<.fullnameOverride | string | `""` |  |
| vulndb.<<.containerPort | int | `8080` |  |
| vulndb.<<.lifecycle.preStopSleep | int | `30` |  |
| vulndb.<<.livenessProbe | object | `{"enabled":true,"failureThreshold":10,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | liveness settings |
| vulndb.<<.readinessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":5,"path":null,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":3}` | readiness settings |
| vulndb.<<.readinessProbe.path | string | `nil` | defaults to healthcheckPath |
| vulndb.<<.autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":null}` | autoscaling settings |
| vulndb.<<.service | object | `{"port":80,"portName":null,"protocol":"TCP","targetPort":null,"type":"ClusterIP"}` | service settings |
| vulndb.<<.ingress | object | `{"annotations":{},"enabled":false,"hosts":[],"tls":[]}` | ingress settings |
| vulndb.<<.resources | object | `{}` |  |
| vulndb.<<.nodeSelector | object | `{}` |  |
| vulndb.<<.tolerations | list | `[]` |  |
| vulndb.<<.affinity | object | `{}` |  |
| vulndb.image.repository | string | `"adevinta/vulnerability-db"` |  |
| vulndb.image.tag | string | `"latest"` |  |
| vulndb.image.pullPolicy | string | `"Always"` |  |
| vulndb.conf.logLevel | string | `"error"` |  |
| vulndb.conf.checksQueueArn | string | `"arn:aws:sqs:local:012345678900:VulcanK8SVulnDBChecks"` |  |
| vulndb.conf.vulnsTopicArn | string | `"arn:aws:sns:local:012345678900:VulcanK8SVulnDBVulns"` |  |
| vulndb.conf.maxEventAge | int | `365` |  |
| vulndb.conf.resultsUrl | string | `"http://vulcan-results.vulcan.com"` |  |
| vulndb.conf.resultsInternalUrl | string | `nil` |  |
| vulndb.proxy.enabled | bool | `false` |  |
| vulndb.infra.sqs | bool | `true` |  |
| vulndb.infra.sns | bool | `true` |  |
| vulndb.db | object | `{"<<":{"ca":null,"host":null,"name":null,"password":"TBD","port":null,"sslMode":"disable","user":"postgres"},"name":"vulnerabilitydb"}` | postgres database settings |
| sqsExporter.enabled | bool | `true` |  |
| sqsExporter.image.repository | string | `"jesusfcr/sqs-exporter"` |  |
| sqsExporter.image.tag | string | `"custom-endpoint"` |  |
| sqsExporter.queueNamePrefix | string | `"VulcanK8S"` |  |
| sqsExporter.resources | object | `{}` |  |
| dogstatsd.apiKey | string | `"TBD"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)