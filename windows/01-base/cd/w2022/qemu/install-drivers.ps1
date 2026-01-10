$ProgressPreference = 'SilentlyContinue'
Write-Host "Install VirtIO Drivers"

certutil.exe -f -addstore "TrustedPublisher" "E:\virtio-win\cert\Virtio_Win_Red_Hat_CA.cer"

pnputil.exe -i -a E:\virtio-win\Balloon\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\fwcfg\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\NetKVM\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\pvpanic\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\qemufwcfg\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\qemupciserial\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viofs\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viogpudo\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioinput\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viomem\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viorng\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioscsi\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioserial\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viostor\2k22\amd64\*.inf

Write-Host "Install QEMU Guest Tools"

msiexec.exe /i E:\virtio-win\guest-agent\qemu-ga-x86_64.msi /quiet /norestart

Start-Sleep -Seconds 5
