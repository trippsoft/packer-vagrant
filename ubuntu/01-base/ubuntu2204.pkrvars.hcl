iso_url = "https://mirror.pilotfiber.com/ubuntu-iso/22.04.4/ubuntu-22.04.4-live-server-amd64.iso"
iso_checksum = "sha256:45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2"
vm_name_prefix = "ubuntu2204"
boot_command = [
  "e<wait>",
  "<down><down><down><end>",
  " net.ifnames=0 biosdevname=0 systemd.unified_cgroup_hierarchy=1 autoinstall ds=nocloud\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]
