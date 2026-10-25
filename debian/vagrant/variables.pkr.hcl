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

variable "headless" {
    type = bool
    default = true
}

locals {
    vm_name = "${var.vm_name_prefix}_${var.vm_name_suffix}"
    project_directory = replace(path.root, "/debian/vagrant", "")
    previous_vm_directory = "${local.project_directory}/debian/${var.relative_previous_vm_directory}"
    efi_vars = "${local.previous_vm_directory}/output/${var.vm_name_prefix}/efivars.fd"
    source_path = "${local.previous_vm_directory}/output/${var.vm_name_prefix}/${var.vm_name_prefix}_${var.previous_vm_suffix}"
    output_directory = "${path.root}/output/${local.vm_name}"
}
