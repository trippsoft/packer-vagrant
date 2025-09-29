#!/usr/bin/env bash

export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS='1'
export PACKER_CACHE_DIR='/mnt/c/Users/github-actions/.packer'
export XDG_CACHE_HOME='/mnt/c/Users/github-actions/.cache'
export VAGRANT_DEFAULT_PROVIDER='hyperv'
export TMPDIR='/mnt/c/Users/github-actions/AppData/Local/Temp'

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
