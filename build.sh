#/bin/bash
mkdir -p build
cd ./build

echo "[I] - Downloading Nest toolchain."
mkdir -p  toolchain
cd toolchain
#wget http://files.chumby.com/toolchain/arm-2008q3-72-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2

echo "[I] - Extracting and setting up toolchain."
#tar xjvf arm-2008q3-72-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
#rm arm-2008q3-72-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
PATH=$PATH:`pwd`/arm-2008q3/bin
echo $PATH
cd ..

echo "[I] - Downloading original NestDfuAttack from GTVHackers"
#wget https://github.com/exploiteers/NestDFUAttack/archive/refs/heads/master.tar.gz
#tar -xvf master.tar.gz
rm master.tar.gz

echo "[I] - Downloading x-loader from google..."
#git clone  https://nest-open-source.googlesource.com/nest-learning-thermostat/5.9.4/x-loader

echo "[I] - Downloading special version of omap_loader"
#git clone https://github.com/ajb142/omap_loader.git

#echo "[I] - Cross compiling x-loader."
#cd x-loader/x-loader
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- distclean
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- j49-usb-loader_config
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
#cd ../..
#if [ ! -f x-loader/x-loader/x-load.bin ]
#    then
#        echo "[E] - Error, x-loader compile failed."
#        exit
#    fi
#
#echo "[I] - Cross compiling u-boot."
#pwd
#cd NestDFUAttack-master/Dev/u-boot
#cp ../../../../mods_u-boot/* ./
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- distclean
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- diamond
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
#cd ../../..
#
#if [ ! -f NestDFUAttack-master/Dev/u-boot/u-boot.bin ]
#    then
#        echo "[E] - Error, u-boot compile failed."
#        exit
#    fi
#
#echo "[I] - Cross compiling Linux (this could take a few minutes.)"
#cd NestDFUAttack-master/Dev/linux
#cp -vR ../../../../mods_linux/* ./
#make ARCH=arm distclean gtvhacker_defconfig
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- uImage
#cd ../../..
#
#if [ ! -f NestDFUAttack-master/Dev/linux/arch/arm/boot/uImage ]
#    then
#        echo "[E] - Error, Linux kernel compile failed."
#        exit
#    fi

echo "[I] - Compiling omap_loader for host machine."
cd omap_loader
git checkout send_correct_jump_for_nest
make clean
make
cd ..

mkdir -p bin
cd bin 
mkdir -p nest
mkdir -p host
cp ../omap_loader/omap_loader ./host
cp ../x-loader/x-loader/x-load.bin ./nest
cp ../NestDFUAttack-master/Dev/u-boot/u-boot.bin ./nest
cp ../NestDFUAttack-master/Dev/linux/arch/arm/boot/uImage ./nest
cd ../..
