#!/bin/bash

set -eux -o pipefail

gcloud auth activate-service-account \
  "${GOOGLE_SERVICE_ACCOUNT_EMAIL}" \
  --key-file="${GOOGLE_KEY_FILE_PATH}" \
  --project="${GOOGLE_PROJECT_NAME}"

source "relint-envs/k8s-environments/${ENVIRONMENT_NAME}/.envrc"
pushd "cf-for-k8s"
  kapp delete -a cf --yes
popd
