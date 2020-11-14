# Cadmium, Linux for Chromebook Duet

## Installation
- Enable developer mode
- ``` ./build-all <pendrive> ```
- Plug >pendrive> into duet via usb-c to usb-a adapter
- Boot from USB
- After running ``` ./install-to-emmc ``` after connecting to internet, Debian _should_ be installed on internal emmc memory
- To update kernel on eMMC memory run: ```./install-kernel``` from <pendrive>
