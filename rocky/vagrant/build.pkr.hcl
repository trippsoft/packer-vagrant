packer {
    required_plugins {
        ansible = {
            version = ">= 1.1.6"
            source = "github.com/hashicorp/ansible"
        }

        vagrant = {
            version = ">= 1.1.7"
            source = "github.com/hashicorp/vagrant"
        }
    }
}

build {
    sources = ["source.qemu.qemu"]

    provisioner "ansible" {
        playbook_file = "${local.project_directory}/ansible/rocky_seal_for_template.yml"
        use_proxy = false
        timeout = "10m"

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
            "ansible_password=${build.Password}",
            "--scp-extra-args",
            "'-O'"
        ]
    }

    post-processors {
        post-processor "vagrant" {
            vagrantfile_template = "${path.root}/Vagrantfile"
            output = "${path.root}/boxes/${local.vm_name}/{{.Provider}}-{{.Architecture}}.box"
            compression_level = 9

            include = [
                "${local.output_directory}/efivars.fd"
            ]
        }
    }
}
