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
# Update examples/templates and update the charts generated README.md files.
./test.sh -f

# Review the updated files and add to the repository.
git add .
```

## Running in a local cluster

Follow this instructions to deploy vulcan in your local cluster.
The service will be available at <https://www.localhost.direct/>.
We use <https://k3d.io> but `Kind` should work, the requirement is to expose the ingress on 127.0.0.1:80/443 ports.

- Start your cluster.

  ```sh
  # Start the cluster on standard ports
  k3d cluster create --port 80:80@Loadbalancer --port 443:443@Loadbalancer
  ```

- Create your SAML application with this callback URL <https://www.localhost.direct/api/v1/login/callback>.
- Set the configuration (i.e. in `private.yaml`).

  ```yaml
  api:
    conf:
      saml:
        metadata: https://example.okta.com/app/myclientid/sso/saml/metadata
        issuer: http://www.okta.com/myclientid
  ````

- Install the application.

  ```sh
  # Install vulcan.
  helm upgrade --install vulcan stable/vulcan -f examples/local.yaml -f private.yaml

  # Wait for the pods to be in a RUNNING state
  kubectl get pods
  ```

- Access the UI <https://www.localhost.direct/>
  - Create your team/s.
  - Add your asset/s.
  - Generate your token in <https://www.localhost.direct/api/v1/home>.

- Load the checks.

  ```sh
  # Load the default checks from https://github.com/adevinta/vulcan-checks
  tools/load-checks.sh
  ```

- Create a scan for your team.

  ```sh
  TOKEN=your-token

  # Find your team_id and set $TEAM_ID
  curl -H "Authorization: Bearer $TOKEN" -s https://www.localhost.direct/api/v1/teams

  TEAM_ID=your-team_id

  # Launch a scan
  curl -H "Authorization: Bearer $TOKEN"  -H 'Accept: scan' -H 'Content-Type: application/json' -s \
    --data '{"program_id": "periodic-full-scan"}' \
    https://www.localhost.direct/api/v1/teams/$TEAM_ID/scans
  ```

- Start the agent to process the checks

  ```sh
  # Start the agent
  tools/agent.sh
  ````

- See the findings in <https://www.localhost.direct/> --> `Security` --> `Live report`.
