# Cadmium, Linux for MT8183-based Lenovo Chromebook Duet

## Installation
- Enable developer mode
- ``` ./build-all <pendrive> ```
- Plug <pendrive> into duet via usb-c to usb-a adapter
- Boot from USB
- After running ``` ./install-to-emmc ``` after connecting to internet, Debian _should_ be installed on internal emmc memory
- To update kernel on eMMC memory run: ```./install-kernel``` from <pendrive>

### OR
- Enable developer mode
- Write uncompressed release image
- Boot from USB
- Run ```./install-to-emmc```

#### Due to GPU working only in mesa-git, only llvmpipe driver is available until there is a release with support for Mali G72 in Panfrost
#### *Binary drivers are unsupported in Cadmium*

## Dependencies on build machine
- Recent Linux distribution
- Binfmt when Debian rootfs is used
- ```debootstrap``` when Debian rootfs is used
- ```qemu-user-static vboot_utils u-boot-tools```
- Build dependencies for kernel compilation
