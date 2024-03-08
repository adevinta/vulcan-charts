#!/bin/bash

set -e

KVERSION="${KVERSION:-"1.25.9"}"

BASEDIR=$(dirname "$0")

if [ -n "$1" ]
then
  find "$BASEDIR/stable" -maxdepth 1 -mindepth 1 -type d -print -exec helm dep update {} \;
fi

OUTDIR=$BASEDIR/examples/templates
for f in "$BASEDIR"/examples/*.yaml; do
  # Generate the examples with the first version
  fn=$(basename -- "$f")
  echo "Generating examples in $OUTDIR/$fn based on $KVERSION"
  helm template myrelease --kube-version "$KVERSION" "$BASEDIR/stable/vulcan" --namespace ns -f "$f" > "$OUTDIR/$fn"
done

if [[ "$(git status --porcelain | grep -Ec '^ M (examples/templates|stable/.+/README.md)')" != 0 ]]; then
  echo "Changes detected, remember to commit them"
  git diff
  exit 1
else
  echo "No changes"
fi
