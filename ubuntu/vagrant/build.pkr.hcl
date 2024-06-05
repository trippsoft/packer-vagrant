packer {
  required_plugins {
    ansible = {
      version = ">= 1.1.1"
      source = "github.com/hashicorp/ansible"
    }

    vagrant = {
      version = ">= 1.1.2"
      source = "github.com/hashicorp/vagrant"
    }
  }
}

build {
  sources = [
    "source.qemu.qemu"
  ]

  provisioner "ansible" {
    playbook_file = "${path.root}/../../ansible/playbooks/ubuntu_seal_for_template.yml"
    use_proxy = false

    extra_arguments = [
      "-e",
      "target_hostname=${local.hostname} ansible_password=${build.Password}"
    ]
  }

  post-processors {
    post-processor "vagrant" {
      vagrantfile_template = "${path.root}/Vagrantfile"
      output = "${path.root}/${local.vm_name}_{{.BuildName}}_{{.Provider}}_{{.Architecture}}.box"
    }

    post-processor "vagrant-cloud" {
      access_token = var.vagrant_cloud_token
      box_tag = local.box_tag
      version = local.box_version
      keep_input_artifact = false
    }
  }
}
