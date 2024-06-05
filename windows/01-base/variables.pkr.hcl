variable "boot_wait" {
  type    = string
  default = "1s"
}

variable "iso_url" {
  type = string
}

variable "iso_checksum" {
  type = string
}

variable "vm_name_prefix" {
  type = string
}

locals {
  vm_name = "${var.vm_name_prefix}_base"
  qemu_output_directory = "${path.root}/output/${var.vm_name_prefix}/qemu"
}
