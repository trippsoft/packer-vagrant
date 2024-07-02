iso_url = "https://releases.ubuntu.com/20.04.6/ubuntu-20.04.6-live-server-amd64.iso"
iso_checksum = "sha256:b8f31413336b9393ad5d8ef0282717b2ab19f007df2e9ed5196c13d8f9153c8b"
vm_name_prefix = "ubuntu2004"
boot_wait = "2s"
boot_command = [
  "<up><wait>",
  "<up><wait><esc><wait>",
  "<f6><wait><esc><wait>",
  "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
  "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
  "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
  "/casper/vmlinuz ",
  "initrd=/casper/initrd ",
  "net.ifnames=0 biosdevname=0 systemd.unified_cgroup_hierarchy=0 autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ",
  "<enter>"
]
