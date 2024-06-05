iso_url = "https://releases.ubuntu.com/24.04/ubuntu-24.04-live-server-amd64.iso"
iso_checksum = "sha256:8762f7e74e4d64d72fceb5f70682e6b069932deedb4949c6975d0f0fe0a91be3"
vm_name_prefix = "ubuntu2404"
boot_command = [
  "e<wait>",
  "<down><down><down><end>",
  " autoinstall ds=nocloud\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]
