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
    playbook_file = "${path.root}/../../ansible/playbooks/ubuntu_first_steps.yml"
    use_proxy = false

    extra_arguments = [
      "-e",
      "ansible_password=${build.Password} is_workstation=${var.is_workstation}"
    ]
  }
}
