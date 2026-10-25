#!/usr/bin/env bash

source "$HOME/venv/$1/bin/activate"

PACKER_VAR_FILE="./$2/01-base/$3.pkrvars.hcl"

/usr/bin/packer build \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$2/01-base || \
/usr/bin/packer build \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$2/01-base || \
/usr/bin/packer build \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$2/01-base
