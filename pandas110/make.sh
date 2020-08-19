#!/usr/bin/env bash

set -e

if [ -z "$1" ] ; then
    echo "Need to provide the output file name as the first argument"
    exit 1
fi

OUTPUT_FILENAME=$1

docker run --rm -v $(pwd):/foo -w /foo  prognosai/lambda_layers:0.1 bash /foo/install_and_clean.sh

mv pandas110.zip $OUTPUT_FILENAME
