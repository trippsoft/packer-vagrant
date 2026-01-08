packer {
    required_plugins {
        vmware = {
            version = ">= 1.2.0"
            source = "github.com/hashicorp/vmware"
        }
    }
}

source "vmware-vmx" "vmware" {
    vm_name = local.vm_name
    headless = var.headless

    vnc_disable_password = true

    source_path = local.vmware_source_path

    vmx_data = {
        "mainMem.useNamedFile" = "FALSE"
        "MemTrimRate" = "0"
        "prefvmx.useRecommendedLockedMemSize" = "TRUE"
        "MemAllowAutoScaleDown" = "FALSE"
        "sched.mem.pshare.enable" = "FALSE"
    }

    cd_files = [
        "${path.root}/cd/vmware/*"
    ]

    boot_wait = "-1s"

    communicator = "ssh"
    ssh_username = "Administrator"
    ssh_password = "Packer42-"
    ssh_timeout = "5m"

    shutdown_command = "E:\\shutdown.cmd"
    shutdown_timeout = "10m"

    vmx_data_post = {
        "ide0:0.present" = "FALSE"
        "ide1:0.present" = "FALSE"
    }

    output_directory = local.vmware_output_directory
}
