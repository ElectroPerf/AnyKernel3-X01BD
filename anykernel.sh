# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Etherious HMP OC Kernel by SonalSingh18 & Curious_To_Learn
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=X01BD
device.name2=X01BDA
device.name3=ASUS_X01BD
device.name4=ASUS_X01BDA
device.name5=
supported.versions=10.0-11.0
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

# Mount partitions as rw
mount /system;
mount /vendor;
mount -o remount,rw /system;
mount -o remount,rw /vendor;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
dump_boot;
write_boot;
## end install

