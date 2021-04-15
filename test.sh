#!/bin/bash

set -e 

BASEDIR=$(dirname "$0")

if [ -n "$1" ]
then
  find $BASEDIR/stable -type f -name "*.tgz" | xargs rm
  rm -f $BASEDIR/stable/vulcan/charts/*.tgz
  find $BASEDIR/stable -maxdepth 1 -mindepth 1 -type d -print -exec helm dep update --skip-refresh {} \;
fi

helm lint $BASEDIR/stable/*

OUTDIR=$BASEDIR/examples/templates
for f in $BASEDIR/examples/*.yaml
do
    fn=$(basename -- "$f")
    echo "Validating $fn -> $OUTDIR/$fn"
    helm template myrelease $BASEDIR/stable/vulcan --namespace ns -f $f --debug > $OUTDIR/$fn
    cat $OUTDIR/$fn | kubeval --strict --ignore-missing-schemas
done
