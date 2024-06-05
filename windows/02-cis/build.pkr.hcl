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
    playbook_file = "${path.root}/../../ansible/playbooks/win_cis.yml"
    use_proxy = false
    extra_arguments = [
      "-e",
      "ansible_shell_type=powershell ansible_password=${build.Password} ansible_become_method=runas ansible_become_user=SYSTEM"
    ]
  }
}
