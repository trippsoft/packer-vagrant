packer {
    required_plugins {
        vmware = {
            version = ">= 1.2.0"
            source = "github.com/hashicorp/vmware"
        }
    }
}

source "vmware-iso" "vmware" {
    vm_name = local.vm_name
    headless = var.headless
    version = var.vmware_version
    firmware = "efi"
    guest_os_type = var.vmware_guest_os_type

    vnc_disable_password = true

    cpus = 4
    memory = 8192

    network = "nat"
    network_adapter_type = "vmxnet3"

    disk_size = 81920
    disk_adapter_type = "pvscsi"

    iso_url = var.iso_url
    iso_checksum = var.iso_checksum

    cd_files = [
        "${path.root}/cd/common/*",
        "${path.root}/cd/vmware/*",
        "${path.root}/cd/${var.vm_name_prefix}/vmware/*",
        "${path.root}/cd/${var.vm_name_prefix}/vmware-drivers/*",
    ]

    boot_wait = "-1s"
    boot_command = [
        "<enter><wait><enter><wait><enter><wait><enter>"
    ]

    communicator = "winrm"
    winrm_username = "Administrator"
    winrm_password = "Packer42-"
    winrm_timeout = "1h"
    winrm_use_ssl = false

    shutdown_command = "shutdown /s /t 10 /f"
    shutdown_timeout = "10m"

    output_directory = local.vmware_output_directory
}
