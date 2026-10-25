#!/usr/bin/env bash

source "$HOME/venv/$1/bin/activate"

PACKER_VAR_FILE="./$2/02-cis/$3.pkrvars.hcl"

/usr/bin/packer build \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$2/02-cis || \
/usr/bin/packer build \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$2/02-cis || \
/usr/bin/packer build \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$2/02-cis
