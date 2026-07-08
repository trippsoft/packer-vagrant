#!/usr/bin/env bash

source ~/venv/ansible-2.16/bin/activate

PACKER_VAR_FILE="./$1/vagrant/${2}_$3.pkrvars.hcl"

/usr/bin/packer build \
    -only "*.vmware" \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$1/vagrant || \
/usr/bin/packer build \
    -only "*.vmware" \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$1/vagrant || \
/usr/bin/packer build \
    -only "*.vmware" \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$1/vagrant
