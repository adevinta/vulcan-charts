#!/bin/bash

set -e 

BASEDIR=$(dirname "$0")

if [ -n "$1" ]
then
  find $BASEDIR/stable -type f -name "*.tgz" -print -delete
  find $BASEDIR/stable -maxdepth 1 -mindepth 1 -type d -print -exec helm dep update {} \;
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
