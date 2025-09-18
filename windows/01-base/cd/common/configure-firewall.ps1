$ProgressPreference = 'SilentlyContinue'
Write-Host "Configure Windows Firewall"

Enable-NetFirewallRule -Group "@FirewallAPI.dll,-28752"
Enable-NetFirewallRule -Group "@FirewallAPI.dll,-28782"
Enable-NetFirewallRule -Group "@FirewallAPI.dll,-27000"
Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory Private
