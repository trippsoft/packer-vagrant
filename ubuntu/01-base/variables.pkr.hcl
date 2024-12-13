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

variable "boot_wait" {
  type = string
  default = "5s"
}

variable "boot_command" {
  type = list(string)
}

variable "headless" {
  type = bool
  default = true
}

locals {
  vm_name = "${var.vm_name_prefix}_base"
  qemu_http_directory = "${path.root}/http/${var.vm_name_prefix}/qemu"
  qemu_output_directory = "${path.root}/output/${var.vm_name_prefix}/qemu"
}
