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

  cpus = 4
  memory = 8192

  switch_name = var.hyperv_switch_name

  disk_size = "81920"

  iso_url = var.iso_url
  iso_checksum = var.iso_checksum

  cd_files = [
    "${path.root}/cd/common/*",
    "${path.root}/cd/hyperv/*",
    "${path.root}/cd/${var.vm_name_prefix}/hyperv/*"
  ]

  boot_wait = "0s"
  boot_command = [
    "<enter><wait><enter><wait><enter><wait><enter>"
  ]

  communicator = "winrm"
  winrm_username = "Administrator"
  winrm_password = "Packer42-"
  winrm_timeout = "1h"
  winrm_use_ssl = false

  shutdown_command = "shutdown /s /t 10 /f"
  shutdown_timeout = "10m"

  output_directory = local.hyperv_output_directory
}
