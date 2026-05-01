iso_url = "https://releases.ubuntu.com/26.04/ubuntu-26.04-live-server-amd64.iso"
iso_checksum = "sha256:dec49008a71f6098d0bcfc822021f4d042d5f2db279e4d75bdd981304f1ca5d9"
vm_name_prefix = "ubuntu2604"
boot_command = [
  "e<wait>",
  "<down><down><down><end>",
  " net.ifnames=0 biosdevname=0 systemd.unified_cgroup_hierarchy=1 autoinstall ds=nocloud\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]
