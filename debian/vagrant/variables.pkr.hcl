variable "relative_previous_vm_directory" {
  type = string
}

variable "previous_vm_suffix" {
  type = string
}

variable "vm_name_prefix" {
  type = string
}

variable "vm_name_suffix" {
  type = string
}

variable "vagrant_hcp_client_id" {
  type = string
  sensitive = true
}

variable "vagrant_hcp_client_secret" {
  type = string
  sensitive = true
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
  vm_name = "${var.vm_name_prefix}_${var.vm_name_suffix}"
  box_tag = "jtarpley/${local.vm_name}"
  hostname = replace("${local.vm_name}", "_", "-")
  box_version = formatdate("YYYY.MM.DD", timestamp())
  previous_vm_directory = "${path.root}/${var.relative_previous_vm_directory}"
  hyperv_previous_vm_name = "${var.vm_name_prefix}_${var.previous_vm_suffix}"
  qemu_efi_vars = "${local.previous_vm_directory}/${var.vm_name_prefix}/qemu/efivars.fd"
  qemu_source_path = "${local.previous_vm_directory}/${var.vm_name_prefix}/qemu/${var.vm_name_prefix}_${var.previous_vm_suffix}"
  qemu_output_directory = "${path.root}/output/${local.vm_name}/qemu"
}
