$ProgressPreference = 'SilentlyContinue'
Write-Host "Install VirtIO Drivers"

certutil.exe -f -addstore "TrustedPublisher" "E:\virtio-win\cert\Virtio_Win_Red_Hat_CA.cer"

pnputil.exe -i -a E:\virtio-win\Balloon\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\fwcfg\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\NetKVM\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\pvpanic\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\qemufwcfg\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\qemupciserial\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viofs\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viogpudo\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioinput\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viomem\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viorng\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioscsi\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioserial\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viostor\w10\amd64\*.inf

Write-Host "Install QEMU Guest Tools"

msiexec.exe /i E:\virtio-win\guest-agent\qemu-ga-x86_64.msi /quiet /norestart

Start-Sleep -Seconds 5
