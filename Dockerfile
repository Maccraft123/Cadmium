# FROM ubuntu:20.04
FROM debian:10

ARG DEBIAN_FRONTEND=noninteractive
# RUN sed -i "s/# deb-src/deb-src/g" /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian buster main" >> /etc/apt/sources.list \
    && echo "deb-src http://deb.debian.org/debian buster-updates main" >> /etc/apt/sources.list \
    && echo "deb-src http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list

RUN apt-get update \
    && apt-get build-dep -y linux \
    && apt-get install -y libarchive-tools curl wget f2fs-tools cgpt vboot-utils libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf qemu-user-static gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu parted udev git debootstrap u-boot-tools qemu-user lz4

# Newer version of qemu-aarch64-static is needed as it fixes a bug causing a segfault
RUN wget http://security.ubuntu.com/ubuntu/pool/universe/q/qemu/qemu-user-static_5.2+dfsg-9ubuntu3.1_amd64.deb \
    && dpkg -i qemu-user-static_5.2+dfsg-9ubuntu3.1_amd64.deb \
    && rm qemu-user-static_5.2+dfsg-9ubuntu3.1_amd64.deb

# arch-test causes debootstrap to fail. Remove
RUN apt-get remove -y arch-test
    # && update-binfmts --enable \
    # && service binfmt-support restart

