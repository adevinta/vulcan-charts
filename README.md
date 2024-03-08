# Adevinta Vulcan Helm Repository

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Test](https://github.com/adevinta/vulcan-charts/actions/workflows/test.yml/badge.svg)](https://github.com/adevinta/vulcan-charts/actions/workflows/test.yml)
[![Release](https://github.com/adevinta/vulcan-charts/actions/workflows/release.yml/badge.svg)](https://github.com/adevinta/vulcan-charts/actions/workflows/release.yml)

https://adevinta.github.io/vulcan-charts

## Vulcan Charts

Add the Vulcan repository to Helm:

```sh
helm repo add vulcan https://adevinta.github.io/vulcan-charts
```

### Vulcan

Create the `vulcan` namespace:

```sh
kubectl create ns vulcan
```

Create a `values.yaml` config file with the parameters or choose one of the files in examples.

Install vulcan application:

```sh
helm upgrade -i vulcan vulcan/vulcan -f examples/local.yaml --namespace vulcan
```

## Contributors

In order to generate a new release, increment the [chart version](https://github.com/adevinta/vulcan-charts/blob/master/stable/vulcan/Chart.yaml). The version increment can be postponed if more changes are pending to be applied to the chart before the release. Take into account, thought, that the release process in master will fail if changes are made in the chart and the version has not been updated.

Before committing changes execute the following commands:

```sh
# Validate the charts.
./test.sh true

# Compare against the latest chart version updating deps
./compare.sh latest true

# Compare against the latest chart version without updating deps
./compare.sh latest false

# Compare against a release
./compare.sh 1.1.0 true

# Compare results with other version (i.e. master)
git clone . base
git -C base checkout master

./compare.sh base/stable/vulcan true
```
