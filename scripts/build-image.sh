#!/usr/bin/env bash

IMAGE_NAME="gcr.io/${PROJECT_ID}/snapshot/${REPO_NAME}"

docker build -t "${IMAGE_NAME}:${SHORT_SHA}" .

docker push "${IMAGE_NAME}:${SHORT_SHA}"
