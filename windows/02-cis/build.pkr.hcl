packer {
    required_plugins {
        ansible = {
            version = ">= 1.1.4"
            source = "github.com/hashicorp/ansible"
        }
    }
}

build {
    sources = [
        "source.qemu.qemu",
        "source.hyperv-vmcx.hyperv",
        "source.vmware-vmx.vmware"
    ]

    provisioner "ansible" {
        playbook_file = "${local.project_directory}/ansible/win_cis.yml"
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
            "ansible_shell_type=powershell ansible_password=${build.Password} ansible_become_method=runas ansible_become_user=SYSTEM",
            "--scp-extra-args",
            "'-O'"
        ]
    }
}
