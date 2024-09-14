packer {
  required_plugins {
    windows-update = {
      version = ">= 0.16.8"
      source = "github.com/rgl/windows-update"
    }
  }
}

build {
  sources = [
    "source.qemu.qemu"
  ]

  provisioner "windows-update" {
    search_criteria = "BrowseOnly=0 and IsInstalled=0"

    filters = [
      "exclude:$_.Title -like '*Preview*'",
      "exclude:$_.InstallationBehavior.CanRequestUserInput",
      "include:$true"
    ]
  }

  provisioner "windows-shell" {
    inline = [
      "C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319\\ngen.exe update /force",
    ]
  }
}
