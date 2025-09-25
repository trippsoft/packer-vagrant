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
        "source.hyperv-iso.hyperv"
    ]

    provisioner "ansible" {
        playbook_file = "${local.project_directory}/ansible/debian_first_steps.yml"
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
            "ansible_password=vagrant",
            "--scp-extra-args",
            "'-O'"
        ]
    }
}
