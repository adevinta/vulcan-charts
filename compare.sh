#!/bin/bash

set -e

base="${1?Path to the chart or chart version}"
dep_update="${2?Update dependencies true/false}"

ARGS=()
if [ -d "$base" ]; then

  ARGS+=("$base")
  [[ "$dep_update" == "false" ]] || helm dep update "$base"

elif [[ "$base" == "latest" ]]; then

  ARGS+=(vulcan/vulcan)
  [[ "$dep_update" == "false" ]] || helm repo add vulcan https://adevinta.github.io/vulcan-charts

elif [[ "$base" =~ [0-9]+\.[0-9]+\.[0-9]+ ]]; then

  ARGS+=(vulcan/vulcan --version "$base")
  [[ "$dep_update" == "false" ]] || helm repo add vulcan https://adevinta.github.io/vulcan-charts

else

  echo "Wrong base must be a path to the chart or a version"
  exit 1

fi

KVERSION="${KVERSION:-"1.25.9"}"

[[ "$dep_update" == "false" ]] ||  helm dep update stable/vulcan

BASEDIR=$(dirname "$0")

OUTDIR=$BASEDIR/examples/templates
mkdir -p "$OUTDIR"
for f in "$BASEDIR"/examples/*.yaml; do
  # Generate the examples with the first version
  fn=$(basename -- "$f")
  echo "Generating examples in $OUTDIR/$fn based on $KVERSION from ${ARGS[*]}"
  helm template myrelease --kube-version "$KVERSION" "$BASEDIR/stable/vulcan" --namespace ns -f "$f" > "$OUTDIR/$fn"
  helm template myrelease --kube-version "$KVERSION" "${ARGS[@]}" --namespace ns -f "$f" > "$OUTDIR/base-$fn"
  diff --color "$OUTDIR/base-$fn" "$OUTDIR/$fn" || true
done
