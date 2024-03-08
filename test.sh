#!/bin/bash

set -e

dep_update="${1?Update dependencies true/false}"

BASEDIR=$(dirname "$0")
KVERSION_LIST=${KVERSION_LIST:-"1.19.16 1.25.9 1.26.4 1.27.2"}

if [[ "$dep_update" == "true" ]]; then
  find "$BASEDIR/stable" -type f -name "*.tgz" -print -delete
  find "$BASEDIR/stable" -maxdepth 1 -mindepth 1 -type d -print -exec helm dep update {} \;
fi

for f in $BASEDIR/examples/*.yaml
do
  for kv in $KVERSION_LIST
  do
    echo "Validating $f against $kv"
    helm template myrelease --kube-version "$kv" "$BASEDIR/stable/vulcan" --namespace ns -f "$f" --debug \
      | docker run -i ghcr.io/yannh/kubeconform:master -kubernetes-version "$kv" -strict -summary -output json
  done
done
