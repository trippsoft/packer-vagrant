$ProgressPreference = 'SilentlyContinue'
Write-Host "Install OpenSSH"

netsh advfirewall firewall add rule name="OpenSSH-Install" dir=in localport=22 protocol=TCP action=block
C:\ProgramData\chocolatey\bin\choco.exe install openssh -y
& 'C:\Program Files\OpenSSH-Win64\install-sshd.ps1'
& 'C:\Program Files\OpenSSH-Win64\Set-SSHDefaultShell.ps1' -PathSpecsToProbeForShellEXEString 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
Set-Service -Name "sshd" -StartupType "Automatic" -Status "Running"
Set-Service -Name "ssh-agent" -StartupType "Manual" -Status "Stopped"
Copy-Item -Path "E:\sshd_config" -Destination "C:\ProgramData\ssh\sshd_config" -Force
net stop sshd
netsh advfirewall firewall delete rule name="OpenSSH-Install"
netsh advfirewall firewall add rule name="OpenSSH" dir=in localport=22 protocol=TCP action=allow
