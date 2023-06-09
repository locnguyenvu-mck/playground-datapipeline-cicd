#!/usr/bin/env bash

echo 'PROJECT_ID: -> ' ${PROJECT_ID:-'not set'}
echo 'TRIGGER_NAME: -> ' ${TRIGGER_NAME:-'not set'}
echo 'BRANCH_NAME: -> ' ${BRANCH_NAME:-'not set'}

IMAGE_NAME="gcr.io/${PROJECT_ID}/${TRIGGER_NAME}/${BRANCH_NAME//\//-}"

docker build -t "${IMAGE_NAME}:${SHORT_SHA}" .

docker push "${IMAGE_NAME}:${SHORT_SHA}"
