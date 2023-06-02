#!/bin/bash

set -e

persistence=https://persistence.localhost.direct/
checktypes=${1:-https://adevinta.github.io/vulcan-checks/checktypes/edge.json}

if [[ "$checktypes" =~ ^https?://.+ ]]; then
    checks=$(curl -s "$checktypes")
elif [[ -f "$checktypes" ]]; then
    checks=$(cat "$checktypes")
else
    echo "Error unknown $checktypes"
    return
fi

echo "$checks" | jq  -c '.checktypes[] | select(.options!=null).options=(.options | tostring) | { checktype: .}' \
| while read -r check; do
    echo "INSTALLING $(echo "$check" | jq '.checktype.name' -r)"
    echo "$check" | \
    curl -s -H "Content-type: application/json" -X POST "${persistence}/v1/checktypes" --data-binary @- \
    | jq
done
