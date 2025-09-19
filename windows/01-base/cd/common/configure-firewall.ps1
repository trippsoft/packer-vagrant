$ProgressPreference = 'SilentlyContinue'
Write-Host "Configure Windows Firewall"

$rules = Get-NetFirewallRule
$rules | Where-Object {$_.DisplayGroup -eq "Remote Desktop"} | Enable-NetFirewallRule
$rules | Where-Object {$_.DisplayGroup -eq "Remote Desktop (WebSocket)"} | Enable-NetFirewallRule
$rules | Where-Object {$_.DisplayName -like "*Echo Request*"} | Enable-NetFirewallRule

Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory Private
