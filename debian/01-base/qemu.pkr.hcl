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
    display = "none"
    efi_boot = true
    efi_firmware_code = "/usr/share/edk2/ovmf/OVMF_CODE.fd"
    use_pflash = true
    machine_type = "q35"

    http_directory = local.http_directory

    cpu_model = "host"
    cores = 2
    memory = 2048

    disk_size = "40960"
    disk_discard = "unmap"
    format = "qcow2"

    iso_url = var.iso_url
    iso_checksum = var.iso_checksum

    boot_wait = "5s"
    boot_command = [
        "<down>e",
        "<down><down><down><end>priority=critical net.ifnames=0 biosdevname=0 auto=true preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg",
        "<leftCtrlOn>x<leftCtrlOff>"
    ]

    communicator = "ssh"
    ssh_username = "vagrant"
    ssh_password = "vagrant"
    ssh_timeout = "10m"

    shutdown_command = "sudo -S /sbin/halt -h -p"
    shutdown_timeout = "5m"

    output_directory = local.output_directory
}
