#!/usr/bin/env bash

MAIN_BRANCH=${MAIN_BRANCH:-'origin/main'}
BASE_DIR=$(pwd)
TEMP_DIR=${BASE_DIR}'/temp'

if [ ! -d "${TEMP_DIR}" ]; then
    mkdir -p $TEMP_DIR
fi

if [ -d './pipelines' ]; then
    for pipeline in $(ls -1 './pipelines')
    do
        echo $(git diff --raw $MAIN_BRANCH './pipelines/'$pipeline)
    done
fi

