# Cadmium, Linux for MT8183-based Lenovo Chromebook Duet

<p align="center">
<img src="/pics/duet_small.png" alt="Lenovo Duet running Linux" data-canonical-src="/pics/duet_small.png"/></p>

## Installation
- ``` ./build-all <pendrive> ``` On a Linux machine(ChromeOS doesn't count(except in linux chroot)). For Debian rootfs, binfmt(if host isn't aarch64) and debootstrap need to work correctly.
- Enable developer mode
- Plug <pendrive> into duet via usb-c to usb-a adapter
- Boot from USB
- After running ``` ./install-to-emmc ``` after connecting to internet, Debian _should_ be installed on internal emmc memory
- To update kernel on eMMC memory run: ```./install-kernel``` from pendrive

### OR
- Enable developer mode
- Write uncompressed release image to pendrive
- Boot from USB
- Run ```./install-to-emmc```

#### Due to GPU working correctly only in 21.0.0 mesa, only llvmpipe driver is available until there is a release with support for Mali G72 in Panfrost
#### *Binary drivers are unsupported in Cadmium and never will be*

## Dependencies on build machine
- Recent Linux distribution
- Binfmt when Debian rootfs is used
- ```debootstrap``` when Debian rootfs is used
- ```qemu-user-static``` when build machine is not aarch64
- ```vboot_utils u-boot-tools``` (vbutil_kernel, cgpt and mkimage) to pack kernel into format understandable by depthcharge
- Build dependencies for kernel compilation

#### A Note about kevin:
##### Although there are files in Cadmium about it, kevin was used to seprate board-specific files and kevin isn't as well supported
