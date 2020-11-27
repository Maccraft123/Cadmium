# Cadmium, Linux for Chromebook Duet

## Installation
- Enable developer mode
- Edit config file, *should* be self-explanatory
- ``` ./build-all <pendrive> ```
- Plug <pendrive> into duet via usb-c to usb-a adapter
- Boot from USB
- After running ``` ./install-to-emmc ``` after connecting to internet, Debian _should_ be installed on internal emmc memory
- To update kernel on eMMC memory run: ```./install-kernel``` from <pendrive>
