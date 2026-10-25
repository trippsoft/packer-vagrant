packer {
    required_plugins {
        qemu = {
            version = ">= 1.1.7"
            source = "github.com/hashicorp/qemu"
        }
    }
}

source "qemu" "qemu" {
    vm_name = local.vm_name
    headless = var.headless
    efi_boot = true
    efi_firmware_code = "/usr/share/edk2/ovmf/OVMF_CODE.secboot.fd"
    use_pflash = true
    machine_type = "q35"

    qemuargs = [
        ["-device", "virtio-tablet"]
    ]

    cpu_model = "host"
    cores = 4
    memory = 8192

    disk_size = "81920"
    disk_discard = "unmap"
    format = "qcow2"

    iso_url = var.iso_url
    iso_checksum = var.iso_checksum

    cd_files = [
        "${path.root}/cd/common/*",
        "${path.root}/cd/${var.vm_name_prefix}/*"
    ]

    boot_wait = var.boot_wait
    boot_command = [
        "<enter><wait><enter><wait><enter><wait><enter>"
    ]

    communicator = "ssh"
    ssh_username = "Administrator"
    ssh_password = "Packer42-"
    ssh_timeout = "40m"

    shutdown_command = "shutdown /s /t 10 /f"
    shutdown_timeout = "5m"

    output_directory = local.output_directory
}
