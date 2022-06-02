#!/bin/bash
set -e

readonly AWS_ZIP_FILE=awscliv2.zip
readonly AWS_DIR=aws-installation
readonly SAM_ZIP_FILE=sam.zip
readonly SAM_DIR=sam-installation

echo -e "installing aws cli..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o $AWS_ZIP_FILE
unzip $AWS_ZIP_FILE -d $AWS_DIR
./$AWS_DIR/aws/install

echo -e "installing cdk..."
npm install -g aws-cdk

echo -e "installing sam cli..."
curl -L "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o $SAM_ZIP_FILE
unzip $SAM_ZIP_FILE -d $SAM_DIR
./$SAM_DIR/install

echo -e "cleanup..."
rm -r $AWS_DIR
rm $AWS_ZIP_FILE
rm -r $SAM_DIR
rm $SAM_ZIP_FILE

echo -e "finished..."