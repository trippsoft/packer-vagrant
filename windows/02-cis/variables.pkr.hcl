variable "vm_name_prefix" {
  type = string
}

locals {
  vm_name = "${var.vm_name_prefix}_cis"
  qemu_efi_vars = "${path.root}/../01-base/output/${var.vm_name_prefix}/qemu/efivars.fd"
  qemu_source_path = "${path.root}/../01-base/output/${var.vm_name_prefix}/qemu/${var.vm_name_prefix}_base"
  qemu_output_directory = "${path.root}/output/${var.vm_name_prefix}/qemu"
}
