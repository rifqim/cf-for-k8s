#!/usr/bin/env bash

set -euo pipefail

source "$(dirname $0)/func_log_into_gke_cluster.sh"

log_into_gke_cluster

echo "$VELERO_SERVICE_ACCOUNT_KEY" > velero-service-account.json

velero install \
  --provider gcp \
  --plugins velero/velero-plugin-for-gcp:v1.0.0 \
  --secret-file velero-service-account.json \
  --bucket "${VELERO_TEST_BUCKET}"

