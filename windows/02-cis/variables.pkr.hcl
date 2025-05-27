variable "vm_name_prefix" {
  type = string
}

variable "headless" {
  type = bool
  default = true
}

variable "hyperv_switch_name" {
  type = string
  default = "LAN"
}

locals {
  vm_name = "${var.vm_name_prefix}_cis"
  project_directory = replace(path.root, "/windows/02-cis", "")
  hyperv_source_path = "${local.project_directory}/windows/01-base/output/${var.vm_name_prefix}/hyperv"
  hyperv_output_directory = "${path.root}/output/${var.vm_name_prefix}/hyperv"
  qemu_efi_vars = "${local.project_directory}/windows/01-base/output/${var.vm_name_prefix}/qemu/efivars.fd"
  qemu_source_path = "${local.project_directory}/windows/01-base/output/${var.vm_name_prefix}/qemu/${var.vm_name_prefix}_base"
  qemu_output_directory = "${path.root}/output/${var.vm_name_prefix}/qemu"
}
