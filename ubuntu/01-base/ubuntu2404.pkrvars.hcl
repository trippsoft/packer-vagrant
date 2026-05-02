iso_url = "http://www.gtlib.gatech.edu/pub/ubuntu-releases/24.04.4/ubuntu-24.04.4-live-server-amd64.iso"
iso_checksum = "sha256:e907d92eeec9df64163a7e454cbc8d7755e8ddc7ed42f99dbc80c40f1a138433"
vm_name_prefix = "ubuntu2404"
boot_command = [
  "e<wait>",
  "<down><down><down><end>",
  " net.ifnames=0 biosdevname=0 systemd.unified_cgroup_hierarchy=1 autoinstall ds=nocloud\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]
