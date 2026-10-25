#!/usr/bin/env bash

source "$HOME/venv/$1/bin/activate"

PACKER_VAR_FILE="./$2/vagrant/${3}_$4.pkrvars.hcl"

/usr/bin/packer build \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$2/vagrant || \
/usr/bin/packer build \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$2/vagrant || \
/usr/bin/packer build \
    -var-file="$PACKER_VAR_FILE" \
    -force \
    ./$2/vagrant
