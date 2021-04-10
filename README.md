<p align="center"><img src="/pics/logo/cd_smol.png" alt="Logo" data-canonical-src="/pics/cd_smol.png"/></p>

Thanks @LoganMD for the logo

# Cadmium, Linux for ARM chromebooks that don't get attention elsewhere
### It also doesn't suck!

## Hardware support:
| Hardware support matrix      	| Duet               	| Kevin and Bob        	| Asus C100PA and C201PA	| Acer Spin 513		|
|-------------------------	|--------------------	|----------------	|-------------------------	|-----------------------|
| Internal Display              | Y(needs patches)   	| Y		 	| Y				| Y			|
| External Display		| N			| Y(FW)			| Y				| N			|
| Display autorotation    	| Y                  	| N              	| N				| N			|
| Hardware video decoding	| N			| P			| P				| P(FW)			|
| Touchscreen             	| Y                  	| Y              	| Y				| Y			|
| Pen Input			| Y			| Y			| 				| ?			|
| WiFi                    	| Y(FW)              	| Y(FW)          	| Y(FW)				| Y(FW)			|
| 3D Acceleration         	| Y                  	| Y              	| Y				| Y(FW)			|
| GPU reclocking		| P			| Y			| Y				| Y			|
| Audio                   	| P(speakers broken) 	| Y              	| Y				| P			|
| Bluetooth               	| Y                  	| ?              	| Y				| Y			|
| Front Camera			| N			| Y			| Y				| Y			|
| Back Camera                  	| N                  	|               	| 				|			|
| USB                     	| Y                  	| Y              	| Y				| Y			|
| USB Gadget              	| P                  	| ?              	| N				| 			|
| Suspending and resuming 	| P                  	| Y              	| P(weird stuff)		| Y			|
| eMMC installation       	| Y                  	| Y              	| Y				| Y			|
| KVM Virtualtization		| Y(read wiki)		| Y(read wiki)		| N				| Y			|

## Official discord server is at https://discord.gg/4QhpsHRygt
## Official IRC channel is #cadmium on Freenode IRC, it is bridged to #cadmium-irc channel on discord

## Installation
- ``` ./build-all /dev/sdX ``` On a Linux machine(ChromeOS doesn't count(except in linux chroot)). For Debian rootfs, binfmt and debootstrap are needed to work correctly.
- When ```build-all``` is ran like ```./build-all <file> <size>```, it builds Cadmium to <file> with size of <size>(2G should be fine)
- Enable developer mode
- Plug pendrive into duet via usb-c to usb-a adapter
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
- Build dependencies for kernel compilation
