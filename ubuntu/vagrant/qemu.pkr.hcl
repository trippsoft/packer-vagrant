packer {
  required_plugins {
    qemu = {
      version = ">= 1.1.0"
      source = "github.com/hashicorp/qemu"
    }
  }
}

source "qemu" "qemu" {
  vm_name = local.vm_name
  headless = true
  display = "none"
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

  communicator = "ssh"
  ssh_username = "vagrant"
  ssh_password = "vagrant"

  shutdown_command = "sudo -S /sbin/halt -h -p"
  
  output_directory = local.qemu_output_directory
}
