# Adevinta Vulcan Helm Repository

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/adevinta/vulcan-charts.svg?branch=master)](https://travis-ci.org/adevinta/vulcan-charts)

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

Before committing changes execute the following commands:

```sh
# Update examples/templates and update the charts generated README.md files.
./test.sh -f

# Review the updated files and add to the repository.
git add .
```
