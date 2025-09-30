#!/usr/bin/env bash

source ~/venv/ansible-2.16/bin/activate

PACKER_VAR_FILE="./$1/01-base/$2.pkrvars.hcl"

/usr/bin/packer build \
    -only "*.hyperv" \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$1/01-base || \
/usr/bin/packer build \
    -only "*.hyperv" \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$1/01-base || \
/usr/bin/packer build \
    -only "*.hyperv" \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$1/01-base
