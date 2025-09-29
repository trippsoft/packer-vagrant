#!/usr/bin/env bash

export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS='1'
export PACKER_CACHE_DIR='/mnt/c/Users/github-actions/.packer'
export XDG_CACHE_HOME='/mnt/c/Users/github-actions/.cache'
export VAGRANT_DEFAULT_PROVIDER='hyperv'
export TMPDIR='/mnt/c/Users/github-actions/AppData/Local/Temp'

source ~/venv/ansible-2.16/bin/activate

/usr/bin/packer build \
    -only "*.hyperv" \
    -var-file="./${$1}/vagrant/${$2}_${$3}.pkrvars.hcl" \
    -var-file="/mnt/c/Users/github-actions/vagrant.pkrvars.hcl" \
    -force \
    ./$1/vagrant || \
/usr/bin/packer build \
    -only "*.hyperv" \
    -var-file="./${$1}/vagrant/${$2}_${$3}.pkrvars.hcl" \
    -var-file="/mnt/c/Users/github-actions/vagrant.pkrvars.hcl" \
    -force \
    ./$1/vagrant || \
/usr/bin/packer build \
    -only "*.hyperv" \
    -var-file="./${$1}/vagrant/${$2}_${$3}.pkrvars.hcl" \
    -var-file="/mnt/c/Users/github-actions/vagrant.pkrvars.hcl" \
    -force \
    ./$1/vagrant
