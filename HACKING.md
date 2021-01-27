# Explamantions of common env vars:
- ```$TARGET``` is target device, duet, kevin or other
- ```$ROOTFS``` represents target linux rootfs, Cadmium is made to be independent of rootfs
- ```$CADMIUMROOT``` is root directory of Cadmium containing board/, kernel/, fs/, tmp/ etc. directories

# Various hacks that were used:
- ```/dev/mmcblk?```: On Duet, Linux kernel randomly switches eMMC device between mmcblk0 and mmcblk1, therefore a wildcard has to be used
- eMMC installation script has been split in 3 parts:
- ```install-to-emmc-begin```, which sets up partitioning, firmware and kernel
- ```install-to-emmc-middle```, which installs rootfs. this should be as small as possible
- ```install-to-emmc-end```, which sets up rootfs in order to make it easier to use(user accounts and cadmium-specific configs)
- ```kernel/build``` has duet-specific kernel source :(

# What directory has what:
- ```board/$TARGET/``` is for stuff specific to one device, usually: config files, dts configuration, kernel patches and firmware
- ```fs/``` is for building rootfs that can be used on target device
- ```fs/$ROOTFS``` is for parts that are rootfs-specific
- ```kernel/``` contains only kernel-specific files, including scripts to test whether built kernel works or not

# Random notes:
- MMSYS sits between *everything* related to multimedia
