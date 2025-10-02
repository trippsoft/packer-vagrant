$ProgressPreference = 'SilentlyContinue'
Write-Host "Install VirtIO Drivers"

certutil.exe -f -addstore "TrustedPublisher" "E:\virtio-win\cert\Virtio_Win_Red_Hat_CA.cer"

pnputil.exe -i -a E:\virtio-win\Balloon\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viorng\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioserial\w11\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioinput\w11\amd64\*.inf
