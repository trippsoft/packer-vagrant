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
    use_pflash = true
    machine_type = "q35"

    http_directory = local.qemu_http_directory

    cpu_model = "host"
    cores = 2
    memory = 4096

    disk_size = "40960"
    disk_discard = "unmap"
    format = "qcow2"

    iso_url = var.iso_url
    iso_checksum = var.iso_checksum

    boot_wait = "12s"
    boot_command = [
        "e<down><down><end><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<leftCtrlOn>x<leftCtrlOff>"
    ]

    ssh_username = "vagrant"
    ssh_password = "vagrant"
    ssh_timeout = "60m"

    shutdown_command = "sudo shutdown -h now"

    output_directory = local.qemu_output_directory
}
