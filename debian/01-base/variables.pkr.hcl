variable "iso_url" {
    type = string
}

variable "iso_checksum" {
    type = string
}

variable "vm_name_prefix" {
    type = string
}

variable "is_workstation" {
    type = bool
    default = false
}

variable "headless" {
    type = bool
    default = true
}

locals {
    vm_name = "${var.vm_name_prefix}_base"
    project_directory = replace(path.root, "/debian/01-base", "")
    http_directory = "${path.root}/http/${var.vm_name_prefix}"
    output_directory = "${path.root}/output/${var.vm_name_prefix}"
}
