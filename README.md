# hello world bootloader for BIOS MBR

run: 
```
$ ./make_virtual_vhd.sh
```
to build bootloader with `nasm` assembler and create `virtualbox` vhd image with that bootloader copied to it.
After that the vhd can be mounted and booted from with virtualbox vm and there will be:
```
hello world
```
# prerequisite
you need __nasm__ and __virtualbox__ installed on your system
