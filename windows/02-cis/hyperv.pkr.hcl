packer {
  required_plugins {
    hyperv = {
      version = ">= 1.1.4"
      source  = "github.com/hashicorp/hyperv"
    }
  }
}

source "hyperv-vmcx" "hyperv" {
  vm_name = local.vm_name
  headless = var.headless
  configuration_version = "9.0"
  generation = 2

  clone_from_vmcx_path = local.hyperv_source_path

  cpus = 4
  memory = 8192

  switch_name = var.hyperv_switch_name

  disk_size = "81920"

  enable_tpm = true

  communicator = "ssh"
  ssh_username = "Administrator"
  ssh_password = "Packer42-"

  shutdown_command = "shutdown /s /t 10 /f"
  shutdown_timeout = "10m"

  output_directory = local.hyperv_output_directory
}
