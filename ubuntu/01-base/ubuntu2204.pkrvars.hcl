iso_url = "https://mirror.pilotfiber.com/ubuntu-iso/22.04.5/ubuntu-22.04.5-live-server-amd64.iso"
iso_checksum = "sha256:9bc6028870aef3f74f4e16b900008179e78b130e6b0b9a140635434a46aa98b0"
vm_name_prefix = "ubuntu2204"
boot_command = [
  "e<wait>",
  "<down><down><down><end>",
  " net.ifnames=0 biosdevname=0 systemd.unified_cgroup_hierarchy=1 autoinstall ds=nocloud\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]
