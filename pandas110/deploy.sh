#!/usr/bin/env bash

set -e

if [ -z "$1" ] ; then
    echo "Need to provide the package to be deployed as the first argument"
    exit 1
fi

if [ -z "$2" ] ; then
    echo "Need to provide the S3 bucket name as the second argument"
    exit 1
fi

if [ -z "$3" ] ; then
    echo "Need to provide the S3 bucket prefix as the third argument"
    exit 1
fi

OUTPUT_FILENAME=$1
LAYER_BUCKET=$2
LAYER_PREFIX=$3

aws s3 cp --sse AES256 $OUTPUT_FILENAME s3://${LAYER_BUCKET}/${LAYER_PREFIX}/${OUTPUT_FILENAME}

aws lambda publish-layer-version --layer-name pandas110 --description "Pandas 1.1.0 for Python 3.7" \
    --content S3Bucket=${LAYER_BUCKET},S3Key=${LAYER_PREFIX}/${OUTPUT_FILENAME} --compatible-runtimes python3.7
