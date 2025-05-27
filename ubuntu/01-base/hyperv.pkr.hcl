packer {
  required_plugins {
    hyperv = {
      version = ">= 1.1.4"
      source  = "github.com/hashicorp/hyperv"
    }
  }
}

source "hyperv-iso" "hyperv" {
  vm_name = local.vm_name
  headless = var.headless
  configuration_version = "9.0"
  generation = 2

  http_directory = local.hyperv_http_directory
  http_port_min = 8386
  http_port_max = 8386

  cpus = 2
  memory = 4096

  switch_name = var.hyperv_switch_name

  disk_size = "40960"

  iso_url = var.iso_url
  iso_checksum = var.iso_checksum

  boot_wait = var.boot_wait
  boot_command = var.boot_command

  ssh_username = "vagrant"
  ssh_password = "vagrant"
  ssh_timeout = "60m"

  shutdown_command = "sudo -S /sbin/halt -h -p"

  output_directory = local.hyperv_output_directory
}
