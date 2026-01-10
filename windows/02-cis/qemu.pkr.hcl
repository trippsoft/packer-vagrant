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
    efi_boot = true
    efi_firmware_code = "/usr/share/OVMF/OVMF_CODE.secboot.fd"
    efi_firmware_vars = local.qemu_efi_vars
    use_pflash = true
    machine_type = "q35"

    qemuargs = [
        ["--enable-kvm"],
        ["-cpu", "host,hv_relaxed,hv_vapic,hv_spinlocks=0x1fff,hv_vpindex,hv_runtime,hv_synic,hv_frequencies,hv_tlbflush,hv_ipi,hv_avic"],
        ["-device", "virtio-tablet"]
    ]

    cores = 4
    memory = 8192

    disk_image = true
    disk_size = "81920"
    disk_discard = "unmap"
    format = "qcow2"

    boot_wait = "-1s"

    iso_url = local.qemu_source_path
    iso_checksum = "none"

    communicator = "ssh"
    ssh_username = "Administrator"
    ssh_password = "Packer42-"
    ssh_timeout = "5m"

    shutdown_command = "shutdown /s /t 10 /f"
    shutdown_timeout = "5m"

    output_directory = local.qemu_output_directory
}
