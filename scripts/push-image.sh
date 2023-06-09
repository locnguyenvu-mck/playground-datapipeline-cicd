#!/usr/bin/env bash

echo "Test variable: TEMPLATE_GCS_LOCATION" ${TEMPLATE_GCS_LOCATION:-'not-exist'}
echo "Test variable: IMAGE_NAME" ${IMAGE_NAME:-'not-exist'}

gcloud dataflow flex-template build \
    ${TEMPLATE_GCS_LOCATION} \
    --image="gcr.io/${PROJECT_ID}/${IMAGE_NAME}:${SHORT_SHA}" \
    --sdk-language=PYTHON  \
    --metadata-file=template_spec/metadata.json
