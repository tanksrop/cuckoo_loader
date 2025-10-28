#/bin/bash
cd ./build/bin
sudo ./host/omap_loader -f 'nest/x-load.bin' -f 'nest/u-boot.bin' -a 0x80100000 -f 'nest/uImage' -a 0x80A00000 -v -j 0x80100000
