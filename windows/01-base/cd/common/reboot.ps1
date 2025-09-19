$ProgressPreference = 'SilentlyContinue'
Write-Host "Rebooting System"

shutdown.exe /r /t 1 /f

Start-Sleep -Seconds 60
