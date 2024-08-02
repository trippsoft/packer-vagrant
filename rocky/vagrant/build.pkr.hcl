packer {
  required_plugins {
    ansible = {
      version = ">= 1.1.1"
      source = "github.com/hashicorp/ansible"
    }

    vagrant = {
      version = ">= 1.1.4"
      source = "github.com/hashicorp/vagrant"
    }
  }
}

build {
  sources = [
    "source.qemu.qemu"
  ]

  provisioner "ansible" {
    playbook_file = "${path.root}/../../ansible/rocky_seal_for_template.yml"
    use_proxy = false
    
    ansible_env_vars = [
      "ANSIBLE_HOST_KEY_CHECKING=False",
      "ANSIBLE_NOCOLOR=True"
    ]

    ansible_ssh_extra_args = [
      "-o IdentitiesOnly=yes",
      "-o StrictHostKeyChecking=no",
      "-o UserKnownHostsFile=/dev/null"
    ]

    extra_arguments = [
      "-e",
      "target_hostname=${local.hostname} ansible_password=${build.Password}"
    ]
  }

  post-processors {
    post-processor "vagrant" {
      vagrantfile_template = "${path.root}/Vagrantfile"

      include = [
        "${local.qemu_output_directory}/efivars.fd"
      ]

      output = "${path.root}/${local.vm_name}_{{.BuildName}}_{{.Provider}}_{{.Architecture}}.box"
    }

    post-processor "vagrant-registry" {
      client_id = var.vagrant_hcp_client_id
      client_secret = var.vagrant_hcp_client_secret
      box_tag = local.box_tag
      version = local.box_version
      keep_input_artifact = true
      no_direct_upload = true
    }
  }
}
