$ProgressPreference = 'SilentlyContinue'
Write-Host "Configure PowerShell"

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
Install-PackageProvider Nuget -Force -Scope AllUsers
Install-Module -Name PackageManagement -Force -Scope AllUsers
Install-Module -Name PowerShellGet -Force -Scope AllUsers
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
