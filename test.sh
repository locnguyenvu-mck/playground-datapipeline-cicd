#!/usr/bin/env bash

echo "Test variable: TEMPLATE_GCS_LOCATION" ${TEMPLATE_GCS_LOCATION:-'not-exist'}
echo "Test variable: IMAGE_NAME" ${IMAGE_NAME:-'not-exist'}
