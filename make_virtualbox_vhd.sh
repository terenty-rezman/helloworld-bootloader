#!/usr/bin/env bash

# you need 'nasm' and 'virualbox' installed on your system

# build bootloader from src
nasm -f bin -o bootloader.bin bootloader.asm

# bootloader.bin can already be run with qemu:
# $ qemu-system-x86_64 bootloader.bin

# create 10m file filled with zeros
dd if=/dev/zero of=disk.raw bs=1M count=10

# create filesystem in file as it was a disk
mkfs -t ext4 disk.raw

# copy bootloader to MBR
dd conv=notrunc if=bootloader.bin of=disk.raw

# convert to virtual box virtual hard drive
VBoxManage convertfromraw disk.raw disk.vhd --format VHD

# now disk can be mounted from virtualbox
