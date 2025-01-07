iso_url = "https://mirror.pilotfiber.com/ubuntu-iso/24.04/ubuntu-24.04.1-live-server-amd64.iso"
iso_checksum = "sha256:e240e4b801f7bb68c20d1356b60968ad0c33a41d00d828e74ceb3364a0317be9"
vm_name_prefix = "ubuntu2404"
boot_command = [
  "e<wait>",
  "<down><down><down><end>",
  " net.ifnames=0 biosdevname=0 systemd.unified_cgroup_hierarchy=1 autoinstall ds=nocloud\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]
