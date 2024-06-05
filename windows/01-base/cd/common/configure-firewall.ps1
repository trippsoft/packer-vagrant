$ProgressPreference = 'SilentlyContinue'
Write-Host "Configure Windows Firewall"

Enable-NetFirewallRule -Group "@FirewallAPI.dll,-28752"
Enable-NetFirewallRule -Group "@FirewallAPI.dll,-28782"
New-NetFirewallRule -Action Allow -Direction Inbound -DisplayName 'ICMPv4 - Destination Unreachable In' -IcmpType '3' -Profile Any -Protocol ICMPv4
New-NetFirewallRule -Action Allow -Direction Inbound -DisplayName 'ICMPv4 - Source Quench In' -IcmpType '4' -Profile Any -Protocol ICMPv4
New-NetFirewallRule -Action Allow -Direction Inbound -DisplayName 'ICMPv4 - Echo Request In' -IcmpType '8' -Profile Any -Protocol ICMPv4
Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory Private
