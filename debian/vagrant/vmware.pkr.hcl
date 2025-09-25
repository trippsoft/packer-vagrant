packer {
    required_plugins {
        vmware = {
            version = ">= 1.2.0"
            source = "github.com/hashicorp/vmware"
        }
    }
}

source "vmware-vmx" "vmware" {
    vm_name = local.vm_name
    headless = var.headless

    vnc_disable_password = true

    source_path = local.vmware_source_path

    ssh_username = "vagrant"
    ssh_password = "vagrant"
    ssh_timeout = "60m"

    shutdown_command = "sudo -S /sbin/halt -h -p"

    output_directory = local.vmware_output_directory
}
