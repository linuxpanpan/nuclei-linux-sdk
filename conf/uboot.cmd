echo 'Loading kernel'
fatload mmc 0 0xa1000000 uImage.lz4
echo 'Decompressing kernel'
unlz4 0xa1000000 0xa0200000 0x10000000
echo 'Loading ramdisk'
fatload mmc 0 0xa1000000 initrd.lz4
echo 'Decompressing ramdisk'
unlz4 0xa1000000 0xa8300000 0x10000000

setenv bootargs 'earlycon=sbi'
echo 'Starts booting from SD'
bootm 0xa0200000 0xa8300000	0xa8000000