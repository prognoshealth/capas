#!/bin/bash

set -e

export PKG_DIR="python"
export PKG_ZIP="pandas110.zip"

rm -rf ${PKG_DIR} && mkdir -p ${PKG_DIR}

pip install -r /foo/requirements.txt --no-deps -t ${PKG_DIR}

find ${PKG_DIR} -name '*.pyc' -delete

find ${PKG_DIR} -name '*.so' | xargs strip

zip -r -9 -q ${PKG_ZIP} .
