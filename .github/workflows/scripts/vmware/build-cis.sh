#!/usr/bin/env bash

source ~/venv/ansible-2.16/bin/activate

PACKER_VAR_FILE="./$1/02-cis/$2.pkrvars.hcl"

/usr/bin/packer build \
    -only "*.hyperv" \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$1/02-cis || \
/usr/bin/packer build \
    -only "*.hyperv" \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$1/02-cis || \
/usr/bin/packer build \
    -only "*.hyperv" \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$1/02-cis
