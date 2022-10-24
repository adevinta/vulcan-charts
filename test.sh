#!/bin/bash

set -e 

BASEDIR=$(dirname "$0")
KVERSION_LIST=${KVERSION_LIST:-"1.24.2 1.15.12 1.21.14"}
KVERSION=${KVERSION:-${KVERSION_LIST%% *}}   # Use KVERSION or the first in the list to generate the examples.

if [ -n "$1" ]
then
  find "$BASEDIR/stable" -type f -name "*.tgz" -print -delete
  find "$BASEDIR/stable" -maxdepth 1 -mindepth 1 -type d -print -exec helm dep update {} \;
fi

helm lint $BASEDIR/stable/*

OUTDIR=$BASEDIR/examples/templates
for f in $BASEDIR/examples/*.yaml
do
  for kv in $KVERSION_LIST
  do
    echo "Validating $f against $kv"
    helm template myrelease --kube-version "$kv" "$BASEDIR/stable/vulcan" --namespace ns -f "$f" --debug \
      | kubeval --strict -v "$kv" -s https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master
  done

  # Generate the examples with the first version
  fn=$(basename -- "$f")
  echo "Generating examples in $OUTDIR/$fn based on $KVERSION"
  helm template myrelease --kube-version "$KVERSION" "$BASEDIR/stable/vulcan" --namespace ns -f "$f" > "$OUTDIR/$fn"
done

docker run --rm --volume "$(pwd):/helm-docs" -u "$(id -u)" jnorwood/helm-docs:v1.11.0 -s file
