#!/bin/bash
set -e

readonly TEXLIVE_PACKAGE_SIZE=$1

dnf install -y texlive-scheme-$TEXLIVE_PACKAGE_SIZE latexmk texstudio

echo -e "finished..."