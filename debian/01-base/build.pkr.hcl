packer {
  required_plugins {
    ansible = {
      version = ">= 1.1.1"
      source = "github.com/hashicorp/ansible"
    }
  }
}

build {
  sources = [
    "source.qemu.qemu"
  ]

  provisioner "ansible" {
    playbook_file = "${path.root}/../../ansible/playbooks/debian_first_steps.yml"
    use_proxy = false

    ansible_env_vars = [
      "ANSIBLE_HOST_KEY_CHECKING=False",
      "ANSIBLE_NOCOLOR=True"
    ]

    ansible_ssh_extra_args = [
      "-o IdentitiesOnly=yes",
      "-o StrictHostKeyChecking=no"
    ]

    extra_arguments = [
      "-e",
      "ansible_password=${build.Password} is_workstation=${var.is_workstation}"
    ]
  }
}
