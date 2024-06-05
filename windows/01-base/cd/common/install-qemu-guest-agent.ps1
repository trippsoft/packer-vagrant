$ProgressPreference = 'SilentlyContinue'
Write-Host "Install QEMU Guest Agent"

C:\ProgramData\chocolatey\bin\choco.exe install qemu-guest-agent -y
