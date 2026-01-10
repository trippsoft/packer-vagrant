$ProgressPreference = 'SilentlyContinue'
Write-Host "Install VirtIO Drivers"

certutil.exe -f -addstore "TrustedPublisher" "E:\virtio-win\cert\Virtio_Win_Red_Hat_CA.cer"

pnputil.exe -i -a E:\virtio-win\Balloon\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\fwcfg\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\NetKVM\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\pvpanic\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\qemufwcfg\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\qemupciserial\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viofs\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viogpudo\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioinput\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viomem\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viorng\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioscsi\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioserial\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viostor\w11\amd64\*.inf

Write-Host "Install QEMU Guest Tools"

msiexec.exe /i E:\virtio-win\guest-agent\qemu-ga-x86_64.msi /quiet /norestart

Start-Sleep -Seconds 5
