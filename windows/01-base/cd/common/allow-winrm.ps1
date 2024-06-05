$ProgressPreference = 'SilentlyContinue'
Write-Host "Enable WinRM Firewall Rule"

Enable-PSRemoting -Force
Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory Private
Enable-NetFirewallRule -Name "WINRM-HTTP-In-TCP"
