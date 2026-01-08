packer {
    required_plugins {
        hyperv = {
            version = ">= 1.1.4"
            source  = "github.com/hashicorp/hyperv"
        }
    }
}

source "hyperv-vmcx" "hyperv" {
    vm_name = local.vm_name
    headless = var.headless
    configuration_version = "9.0"
    generation = 2

    clone_from_vmcx_path = local.hyperv_source_path

    cpus = 2
    memory = 2048

    switch_name = var.hyperv_switch_name

    disk_size = "40960"

    boot_wait = "-1s"

    communicator = "ssh"
    ssh_username = "vagrant"
    ssh_password = "vagrant"
    ssh_timeout = "5m"

    shutdown_command = "sudo -S /sbin/halt -h -p"
    shutdown_timeout = "5m"

    output_directory = local.hyperv_output_directory
}
