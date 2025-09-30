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
    guest_os_type = var.vmware_guest_os_type

    vnc_disable_password = true

    http_directory = local.vmware_http_directory

    cpus = 2
    memory = 4096

    network = "nat"
    network_adapter_type = "vmxnet3"

    disk_size = 40960
    disk_adapter_type = "pvscsi"
    disk_type_id = "0"

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

    output_directory = local.vmware_output_directory
}
