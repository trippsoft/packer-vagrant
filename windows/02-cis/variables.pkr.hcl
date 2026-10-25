variable "vm_name_prefix" {
    type = string
}

variable "headless" {
    type = bool
    default = true
}

locals {
    vm_name = "${var.vm_name_prefix}_cis"
    project_directory = replace(path.root, "/windows/02-cis", "")
    efi_vars = "${local.project_directory}/windows/01-base/output/${var.vm_name_prefix}/efivars.fd"
    source_path = "${local.project_directory}/windows/01-base/output/${var.vm_name_prefix}/${var.vm_name_prefix}_base"
    output_directory = "${path.root}/output/${var.vm_name_prefix}"
}
