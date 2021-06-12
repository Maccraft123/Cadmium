# Cadmium is *the* Linux for ARM chromebooks
### It also doesn't suck!

## Installation
- Make sure that you have developer mode unlocked
- Enable booting from usb, by running ```enable_dev_usb_boot``` in ChromeOS root shell accessible when you log in as root after pressing ctrl + alt + refresh.
- Reboot
Once you have this out, continue with instructions:

- *Edit ./config to reflect your board*
- ``` ./build-all /dev/sdX ``` On a Linux machine(ChromeOS doesn't count(except in linux chroot)). For Debian rootfs, binfmt and debootstrap are needed to work correctly.
- When ```build-all``` is ran like ```./build-all <file> <size>```, it builds Cadmium to <file> with size of <size>(2G should be fine)
- Enable developer mode
- Plug pendrive into your laptop.
- Boot from USB
- After running ``` ./install-to-emmc ``` after connecting to internet, Cadmium will be installed on internal emmc memory
- To update kernel on eMMC memory run: ```./install-kernel``` from pendrive

### OR
- Enable developer mode(instructions are in the wiki for duet)
- Download and uncompress ```cadmium-<device>.tar.gz``` to your pendrive
- Boot from USB
- Run ```./install-to-emmc```

#### *Binary drivers are unsupported in Cadmium and never will be*

## Dependencies on build machine
- Recent Linux distribution
- Binfmt when Debian rootfs is used
- ```debootstrap``` when Debian rootfs is used
- ```qemu-user-static``` when build machine can't run binaries for target machine
- ```vboot-utils u-boot-tools``` (vbutil_kernel, cgpt and mkimage) to pack kernel into format understandable by depthcharge
- ```gcc-aarch64-linux-gnu``` for compiling to ARM64 or ```gcc-arm-linux-gnueabihf``` for compiling to ARMv7
- ```curl``` to download the kernel
- ```bsdtar``` for writing the archive file
- ```f2fs-tools``` for creating the filesystem used by Cadmium
- ```parted``` to prepare gpt table to be modified by cgpt
- Build dependencies for kernel compilation
