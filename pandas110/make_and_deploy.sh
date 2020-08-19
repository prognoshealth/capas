#!/usr/bin/env bash

set -e

PKG=pandas110.zip

./make.sh $PKG
./deploy.sh $PKG
rm $PKG
