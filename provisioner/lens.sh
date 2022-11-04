#!/bin/bash
set -e

readonly LENS_VERSION=$1
readonly RPM_NAME=Lens-$LENS_VERSION.x86_64.rpm

curl -LO https://api.k8slens.dev/binaries/$RPM_NAME
sudo rpm -Uvh ${RPM_NAME}
rm ${RPM_NAME}

echo -e "finished..."