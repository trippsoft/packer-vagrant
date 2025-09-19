$ProgressPreference = 'SilentlyContinue'
Write-Host "Install .NET Framework 4.8"

Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe" -OutFile "$env:TEMP\ndp48-x86-x64-allos-enu.exe"
Start-Process -FilePath "$env:TEMP\ndp48-x86-x64-allos-enu.exe" -ArgumentList "/q" -Wait
Remove-Item -Path "$env:TEMP\ndp48-x86-x64-allos-enu.exe" -Force
