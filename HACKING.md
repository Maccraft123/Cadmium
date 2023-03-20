# You can run Cadmium inside qemu if you built image into file:
```qemu-system-aarch64 -M virt -cpu cortex-a57  -kernel tmp/linux-arm64/arch/arm64/boot/Image -nographic -m 2G -serial mon:stdio -append "console=ttyAMA0,115200 root=/dev/vda3" -drive file=cd.img,if=virtio,format=raw```

# Explamantions of common env vars:
- ```$TARGET``` is target device, krane, kevin or other
- ```$ROOTFS``` represents target linux rootfs, Cadmium is made to be independent of rootfs
- ```$CADMIUMROOT``` is root directory of Cadmium containing board/, kernel/, fs/, tmp/ etc. directories

# Various hacks that were used:
- ```/dev/mmcblk?```: On Duet, Linux kernel randomly switches eMMC device between mmcblk0 and mmcblk1, therefore a wildcard has to be used
- eMMC installation script has been split in 3 parts:
- ```install-to-emmc-begin```, which sets up partitioning, firmware and kernel
- ```install-to-emmc-middle```, which installs rootfs. this should be as small as possible
- ```install-to-emmc-end```, which sets up rootfs in order to make it easier to use(user accounts and cadmium-specific configs)
- ```kernel/build``` has krane-specific kernel source :(

# What directory has what:
- ```board/$TARGET/``` is for stuff specific to one device, usually: config files, dts configuration, kernel patches and firmware
- ```fs/``` is for building rootfs that can be used on target device
- ```fs/$ROOTFS``` is for parts that are rootfs-specific
- ```kernel/``` contains only kernel-specific files, including scripts to test whether built kernel works or not
- ```bootfw/``` has scripts to set up kernel and partition layout

# Random notes:
- MMSYS sits between *everything* related to multimedia

# ```boardinfo``` file in ```board```:
- ```BASEBOARD``` is "reference" board for family of chromebooks or common ancestor
- ```BOARD``` is the target board, for example: ```kevin```, ```krane```
- ```TYPE``` is type of device, ```laptop```, ```tablet```, ```convertible-laptop``` is laptop with 360° hinge, ```convertible-tablet``` is tablet with keyboard attachment or ```handheld```

# ```boardinfo``` file in ```baseboard```:
- ```ARCH``` uses kernel's naming, ```arm```, ```arm64``` etc.
- ```ARCH_UNAME``` is what appears in uname -m, ```armv7l```, ```aarch64``` etc.
- ```ARCH_DEB``` is whatever debian calls the architecture of device, ```armhf```, ```arm64```
- YES ALL THIS ARCH STUFF IS A GIANT MESS
- ```CROSS_COMPILE``` is self-explanatory
- ```SOC``` - self explanatory
- ```BOOTFW``` is boot firmware of device, chromebooks use ```depthcharge``` 
