#!/usr/bin/env bash

source ~/venv/ansible-2.16/bin/activate

ansible-galaxy collection install --upgrade trippsc2.cis trippsc2.first_steps trippsc2.template 'community.general<12.0.0'

/usr/bin/packer init ./debian/01-base
/usr/bin/packer init ./debian/vagrant

/usr/bin/packer init ./fedora/01-base
/usr/bin/packer init ./fedora/vagrant

/usr/bin/packer init ./rocky/01-base
/usr/bin/packer init ./rocky/02-cis
/usr/bin/packer init ./rocky/vagrant

/usr/bin/packer init ./ubuntu/01-base
/usr/bin/packer init ./ubuntu/vagrant

/usr/bin/packer init ./windows/01-base
/usr/bin/packer init ./windows/02-cis
/usr/bin/packer init ./windows/vagrant
