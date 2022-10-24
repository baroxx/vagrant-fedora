#!/bin/bash
set -e

readonly USER_NAME=$1
readonly RPM_NAME=minikube-latest.x86_64.rpm

curl -LO https://storage.googleapis.com/minikube/releases/latest/${RPM_NAME}
sudo rpm -Uvh ${RPM_NAME}
rm ${RPM_NAME}

mkdir -p /home/${USER_NAME}/.minikube/config/
echo -e "{
    \"container-runtime\": \"containerd\",
    \"rootless\": true
}" >> /home/${USER_NAME}/.minikube/config/config.json

echo -e "finished..."