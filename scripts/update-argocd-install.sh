#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-}"
if [[ -z "${VERSION}" ]]; then
  echo "Usage: $0 vX.Y.Z"
  exit 1
fi

OUT="bootstrap/argocd/install.yaml"
URL="https://raw.githubusercontent.com/argoproj/argo-cd/${VERSION}/manifests/install.yaml"

mkdir -p "$(dirname "$OUT")"
curl -fsSL "$URL" -o "$OUT"
echo "Updated: $OUT from $URL"
