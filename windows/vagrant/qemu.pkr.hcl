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

  qemuargs = [
    ["-cpu", "host,arch_capabilities=off"]
  ]

  cores = 4
  memory = 8192

  disk_image = true
  disk_size = "81920"
  disk_discard = "unmap"
  format = "qcow2"

  iso_url = local.qemu_source_path
  iso_checksum = "none"

  cd_files = [
    "${path.root}/cd/qemu/*"
  ]

  communicator = "ssh"
  ssh_username = "Administrator"
  ssh_password = "Packer42-"
  
  shutdown_command = "D:\\shutdown.cmd"
  shutdown_timeout = "10m"
  
  output_directory = local.qemu_output_directory
}
