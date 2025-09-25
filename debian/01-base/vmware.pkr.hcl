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
    firmware = "efi-secure"
    guest_os_type = "debian11-64" # Debian 11 64-bit is closest match to current Debian

    vnc_disable_password = true

    http_directory = local.vmware_http_directory

    cpus = 2
    memory = 2048

    network = "nat"

    disk_size = 40960

    iso_url = var.iso_url
    iso_checksum = var.iso_checksum

    boot_wait = "12s"
    boot_command = [
        "<down>e",
        "<down><down><down><end>priority=critical net.ifnames=0 biosdevname=0 auto=true preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg",
        "<leftCtrlOn>x<leftCtrlOff>"
    ]

    ssh_username = "vagrant"
    ssh_password = "vagrant"
    ssh_timeout = "60m"

    shutdown_command = "sudo -S /sbin/halt -h -p"

    output_directory = local.vmware_output_directory
}