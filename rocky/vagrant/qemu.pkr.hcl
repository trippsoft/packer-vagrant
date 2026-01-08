packer {
    required_plugins {
        qemu = {
            version = ">= 1.1.4"
            source = "github.com/hashicorp/qemu"
        }
    }
}

source "qemu" "qemu" {
    vm_name = local.vm_name
    headless = var.headless
    display = "none"
    efi_boot = true
    efi_firmware_code = "/usr/share/OVMF/OVMF_CODE.secboot.fd"
    efi_firmware_vars = local.qemu_efi_vars
    use_pflash = true
    machine_type = "q35"

    cpu_model = "host"
    cores = 2
    memory = 2048

    disk_image = true
    disk_size = "40960"
    disk_discard = "unmap"
    format = "qcow2"

    iso_url = local.qemu_source_path
    iso_checksum = "none"

    boot_wait = "-1s"

    communicator = "ssh"
    ssh_username = "vagrant"
    ssh_password = "vagrant"
    ssh_timeout = "5m"

    shutdown_command = "sudo -S /sbin/halt -h -p"
    shutdown_timeout = "5m"

    output_directory = local.qemu_output_directory
}
