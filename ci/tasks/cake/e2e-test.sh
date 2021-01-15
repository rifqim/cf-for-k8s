#!/usr/bin/env bash
set -euo pipefail

source "$(dirname $0)/func_log_into_gke_cluster.sh"

log_into_gke_cluster

pushd ./capi-k8s-release/src/backup-metadata-generator
    make test-e2e
popd
