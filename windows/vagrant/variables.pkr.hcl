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

variable "qemu_efi_core" {
    type = string
    default = "/usr/share/edk2/x64/OVMF_CODE.secboot.fd"
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
    box_version = formatdate("YYYY.MM.DD", timestamp())
    hostname = replace("${local.vm_name}", "_", "-")
    project_directory = replace(path.root, "/windows/vagrant", "")
    previous_vm_directory = "${local.project_directory}/windows/${var.relative_previous_vm_directory}"
    hyperv_source_path = "${local.previous_vm_directory}/${var.vm_name_prefix}/hyperv"
    hyperv_output_directory = "${path.root}/output/${local.vm_name}/hyperv"
    qemu_efi_vars = "${local.previous_vm_directory}/${var.vm_name_prefix}/qemu/efivars.fd"
    qemu_source_path = "${local.previous_vm_directory}/${var.vm_name_prefix}/qemu/${var.vm_name_prefix}_${var.previous_vm_suffix}"
    qemu_output_directory = "${path.root}/output/${var.vm_name_prefix}_${var.vm_name_suffix}/qemu"
}
