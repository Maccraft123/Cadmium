<p align="center"><img src="/pics/logo/cd_smol.png" alt="Logo" data-canonical-src="/pics/cd_smol.png"/></p>

Thanks @LoganMD for the logo

# Cadmium, The state-of-the-art Linux distro for RISC laptops that I could get my hands on (atm only ARM Chromebooks)
### It also doesn't suck!

## Hardware support:
### Note: (FW) entries are meant to indicate that firmware(that is included in Cadmium) is needed for piece of hardware to work correctly.
| Hardware support matrix      	| Duet		 	| Kevin and Bob	 	| Asus C100PA and C201PA	| Acer Spin 513		| Duet 5		| HP X2 (2021)		|Lenovo C or S 330			|
|-------------------------	|--------------------	|----------------	|-------------------------	|-----------------------|-----------------------|-----------------------|-----------------------			|
| Internal Display		| Y		   	| Y		 	| Y				| Y			| Y			| Y			|Y			| 
| External Display		| N			| Y(FW)			| Y				| N			| ?			| N			|N			| 
| Display autorotation    	| Y		    	| Y			| N				| N			| Y			| Y			|Y			| 
| Hardware video decoding	| N			| P			| P				| Y(FW)			| ?			| ?			|?			| 
| Touchscreen	    	  	| Y		    	| Y			| Y				| Y			| Y			| Y			|Y			| 
| Pen Input			| Y			| Y			| 				| Y			| ?			| Y			|?			| 
| WiFi		     	 	| Y(FW)			| Y(FW)	   		| Y(FW)				| Y(FW)			| Y(FW)			| Y (FW)		|Y(FW)			| 
| 3D Acceleration	  	| Y		    	| Y			| Y				| Y(FW)			| ?			| Y (FW)		|?			| 
| GPU reclocking		| Y			| Y			| ?				| Y			| ?			| Y			|?			|
| Audio		     		| Y			| Y			| Y				| P(only usb + bt)	| Y			| P(only usb + bt)	|Y			|
| Bluetooth		 	| Y		    	| ?			| N				| Y			| Y			| Y			|N			| 
| Front Camera			| N			| Y			| Y				| Y			| ?			| N			|Y			| 
| Back Camera		    	| N		    	|		 	| 				|			| ?			| N			|			| 
| USB				| Y		    	| Y			| Y				| Y			| Y			| Y			|Y			|
| USB Gadget			| ?		    	| ?			| N				| 			| ?			| ?			|Y			| 
| Suspending and resuming 	| Y		    	| Y			| Y				| Y			| ?			| N			|Y			| 
| eMMC installation		| Y		    	| Y			| Y				| Y			| Y			| ?			|Y			| 
| KVM Virtualtization		| N			| N			| N				| N			| ?			| Y			|?			| 
| Anbox				| P			| N			|				| N			| ?			| ?			|?			| 

## Official IRC channel is #cadmium on Libera.chat
## Official discord server is at https://discord.gg/ZZbwyvKCmV

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
- Enable developer mode(instructions are in the wiki for krane)
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
- ```bsdtar``` for writing the archive file (from the ```libarchive-tools``` package)
- ```f2fs-tools``` for creating the filesystem used by Cadmium
- ```parted``` to prepare gpt table to be modified by cgpt
- Build dependencies for kernel compilation
