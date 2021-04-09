#!/bin/bash

find ./stable -not -name vulcan -maxdepth 1 -mindepth 1 -type d -print -exec helm dep update --skip-refresh {} \;
helm dep update --skip-refresh ./stable/vulcan
helm lint ./stable/*

pushd examples
for f in *.yaml
do
  helm template vulcan ../stable/vulcan --namespace ns -f $f > templates/$f
  helm template vulcan ../stable/vulcan -f $f --debug| kubeval --strict --ignore-missing-schemas
done
popd
