<p align="center"><img src="/pics/logo/cd_smol.png" alt="Logo" data-canonical-src="/pics/cd_smol.png"/></p>

Thanks @LoganMD for the logo

# Cadmium, A Linux ~~distro~~ installer for some RISC laptops

## Hardware support:
- (FW) entries are meant to indicate that firmware(that is included in Cadmium) is needed for piece of hardware to work correctly.
- "Y" means "Is known to work as of last time it was tested"
- "N" means "Is known to not work as of last time it was tested"
- "?" means "Not tested/Unknown"
- "P" means "Partial/Incomplete support, refer to notes"
- "N/A" means "Missing hardware"

| Feature      | RK3288 | MT8173 | MT8183 | SC7180 | X1 Elite |
| ------------ | ------ | ------ | ------ | ------ | -------- |
| Display      | Y      | Y      | Y      | Y      | Y        |
| OpenGL       | Y      | N      | 3.1    | 4.6    | 4.6      |
| Vulkan       | N      | N      | N      | Y      | Y        |
| Video decode | ?      | ?      | ?      | Y      | N        |
| USB Host     | Y      | Y      | Y      | Y      | Y        |
| USB Device   | N      | N      | N      | N      | ?        |
| KVM          | Y      | Y      | Y      | Y      | N        |
| CPUFreq      | Y      | Y      | Y      | Y      | Y        |

| Commercial name          | Codename       |  SOC     | Pen input | Internal Installation  | WiFi | Bluetooth | Audio | Suspend/Resume | Notes                             |
| ------------------------ | -------------- | -------- | --------- | ---------------------- | ---- | --------- | ----- | -------------- | --------------------------------- |
| Asus Chromebook C100PA   | veyron-minnie  | RK3288   | N/A       | ?                      | ?    | ?         | ?     | Y              |                                   |
| Samsung Chromebook Plus  | gru-kevin      | RK3399   | ?         | ?                      | ?    | ?         | ?     | Y              | Libreboot available               |
| Lenovo Chromebook S330   | elm-hana       | MT8173   | N/A       | ?                      | ?    | ?         | ?     | Y              |                                   |
| Lenovo Chromebook Duet   | kukui-krane    | MT8183   | ?         | Y                      | Y    | ?         | Y     | Y              |                                   |
| Acer Chromebook Spin 513 | trogdor-lazor  | SC7180   | ?         | Y                      | Y    | ?         | Y     | Y              | Manual audio switching required   |
| Lenovo Yoga Slim 7x      | N/A            | X1 Elite | N/A?      | Dual-boot with Windows | Y    | Y         | N     | Only manual    | EFI booting                       |

## Official discord server is at https://discord.gg/ZZbwyvKCmV

## Installation
- Make sure that you have developer mode unlocked
- Enable booting from usb, by running ```enable_dev_usb_boot``` in ChromeOS root shell accessible when you log in as root after pressing ctrl + alt + refresh.
- Reboot
Once you have this out, continue with instructions:

- *Edit ./config to reflect your laptop*
- ``` ./build-all /dev/sdX ``` On a Linux machine(ChromeOS doesn't count(except in linux chroot)). For Debian rootfs, binfmt and debootstrap are needed to work correctly.
- When ```build-all``` is ran like ```./build-all <file> <size>```, it builds Cadmium to <file> with size of <size>(8G should be fine)
- Enable developer mode
- Plug pendrive into your laptop.
- Boot from USB
- After running ``` ./install``` after connecting to internet, Cadmium will be installed on internal emmc memory
- To update kernel on eMMC memory run: ```./install-kernel``` from pendrive

### OR
- Enable developer mode(instructions are in the wiki for krane)
- Download and uncompress ```cadmium-<device>.tar.gz``` to your pendrive
- Boot from USB
- Run ```./install```

#### *Binary drivers are unsupported in Cadmium and never will be*

## Dependencies on build machine, Debian is recommended
- Recent Linux distribution
- A working LLVM toolchain
- Build dependencies for kernel compilation
- ```debootstrap``` when Debian rootfs is used
- ```qemu-user-static``` when build machine can't run binaries for the target machine, with binfmt support
- For Chromebook machines running stock boot firmware: ```vboot-utils u-boot-tools``` (vbutil_kernel or futility, cgpt and mkimage)
- For EFI machines: ```ukify```, usually provided in ```systemd-boot``` or related package
- ```bc``` to calculate number of threads to be used for compilation
- ```curl``` to download the kernel
- ```bsdtar``` for writing the archive file (from the ```libarchive-tools``` .deb package)
- ```f2fs-tools``` for creating the filesystem used by Cadmium
- ```parted``` to prepare gpt table to be modified by cgpt
- ```rsync```
