cmd.exe /c winrm quickconfig -q
cmd.exe /c winrm set winrm/config/service @{AllowUnencrypted="true"}
cmd.exe /c winrm set winrm/config/service/auth @{Basic="true"}
sc.exe config WinRM start=auto
