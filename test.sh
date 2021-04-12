#!/bin/bash

if [ -n "$1" ]
then
  find ./stable -not -name vulcan -maxdepth 1 -mindepth 1 -type d -print -exec helm dep update --skip-refresh {} \;
  helm dep update --skip-refresh ./stable/vulcan
fi

helm lint ./stable/*

pushd examples
for f in *.yaml
do
    echo "Validating $f -> templates/$f"
    helm template myrelease ../stable/vulcan --namespace ns -f $f --debug > templates/$f
    cat templates/$f | kubeval --strict --ignore-missing-schemas
done
popd
