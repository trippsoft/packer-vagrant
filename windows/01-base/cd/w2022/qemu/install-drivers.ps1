$ProgressPreference = 'SilentlyContinue'
Write-Host "Install VirtIO Drivers"

certutil.exe -f -addstore "TrustedPublisher" "E:\virtio-win\cert\Virtio_Win_Red_Hat_CA.cer"

pnputil.exe -i -a E:\virtio-win\Balloon\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\viorng\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioserial\2k22\amd64\*.inf
pnputil.exe -i -a E:\virtio-win\vioinput\2k22\amd64\*.inf
