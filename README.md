# Cadmium, Linux for MT8183-based Lenovo Chromebook Duet and other ARM chromebooks

<p align="center">
<img src="/pics/duet_small.png" alt="Lenovo Duet running Linux" data-canonical-src="/pics/duet_small.png"/></p>

## Installation
- ``` ./build-all /dev/sdX ``` On a Linux machine(ChromeOS doesn't count(except in linux chroot)). For Debian rootfs, binfmt(if host isn't aarch64) and debootstrap are needed to work correctly.
- Enable developer mode
- Plug pendrive into duet via usb-c to usb-a adapter
- Boot from USB
- After running ``` ./install-to-emmc ``` after connecting to internet, Debian _should_ be installed on internal emmc memory
- To update kernel on eMMC memory run: ```./install-kernel``` from pendrive

### OR
- Enable developer mode(instructions are in the wiki)
- Write uncompressed release image to pendrive
- Boot from USB
- Run ```./install-to-emmc```

#### *Binary drivers are unsupported in Cadmium and never will be*

## Dependencies on build machine
- Recent Linux distribution
- Binfmt when Debian rootfs is used
- ```debootstrap``` when Debian rootfs is used
- ```qemu-user-static``` when build machine is not aarch64
- ```vboot_utils u-boot-tools``` (vbutil_kernel, cgpt and mkimage) to pack kernel into format understandable by depthcharge
- Build dependencies for kernel compilation

| Hardware support        	| Duet               	| Kevin          	| Asus C100PA			|
|-------------------------	|--------------------	|----------------	|-------------------------	|
| Display                 	| Y(needs patches)   	| Y(DP needs FW) 	| Y				|
| Display autorotation    	| Y                  	| N              	| N				|
| Hardware video decoding	| N			| P			| P				|
| Touchscreen             	| Y                  	| Y              	| Y				|
| WiFi                    	| Y(FW)              	| Y(FW)          	| Y(FW)				|
| 3D Acceleration         	| P                  	| Y              	| Y				|
| Audio                   	| P(speakers broken) 	| Y              	| ?				|
| Bluetooth               	| Y                  	| ?              	| ?				|
| Camera                  	| N                  	| Y              	| ?				|
| USB                     	| Y                  	| Y              	| Y				|
| USB Gadget              	| P                  	| ?              	| ?				|
| Suspending and resuming 	| N                  	| Y              	| P(Dislikes USB booting)	|
| eMMC installation       	| Y                  	| N              	| N				|
