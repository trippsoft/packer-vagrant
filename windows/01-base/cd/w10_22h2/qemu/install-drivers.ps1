$ProgressPreference = 'SilentlyContinue'
Write-Host "Install VirtIO Drivers"

certutil.exe -f -addstore "TrustedPublisher" "E:\virtio-win\cert\Virtio_Win_Red_Hat_CA.cer"

pnputil.exe -i -a E:\virtio-win\Balloon\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viorng\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioserial\w10\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioinput\w10\amd64\*.inf
