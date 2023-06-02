#!/bin/bash

set -e

go install github.com/adevinta/vulcan-agent/cmd/vulcan-agent-docker@latest

AWS_ACCESS_KEY_ID="$(kubectl get secrets/vulcan-minio --template='{{index .data "root-user"}}' | base64 -d)" \
AWS_SECRET_ACCESS_KEY="$(kubectl get secrets/vulcan-minio --template='{{index .data "root-password"}}' | base64 -d)" \
    vulcan-agent-docker agent/config.toml
