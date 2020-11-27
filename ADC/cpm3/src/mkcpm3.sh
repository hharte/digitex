# First, run adc_c3build.bat under Windows 10, and then
# run this script to make CPM.SYS and cold-boot
# loaders for the ADC Super Six.

# Add generated ADC files to an SSSD floppy image.
cp F8.LDR ADC_CPM3.img
dd if=/dev/zero bs=128 count=1978 conv=notrunc iflag=fullblock|tr "\000" "\345" >> ADC_CPM3.img
cpmcp ADC_CPM3.img osload.sys 0:
cpmcp ADC_CPM3.img cpm3.sys 0:
cpmcp ADC_CPM3.img fmthd.com 0:
cpmcp ADC_CPM3.img format.com 0:
cpmcp ADC_CPM3.img ldrgen.com 0:
cpmcp ADC_CPM3.img F8.LDR 0:
cpmcp ADC_CPM3.img Q2020.LDR 0:
cpmcp ADC_CPM3.img dist/*.* 0:
cpmcp ADC_CPM3.img simh/*.* 0:
cpmls ADC_CPM3.img

# Add generated DIGITEX files to an SSSD floppy image.
cp DF8.LDR DIG_CPM3.img
dd if=/dev/zero bs=128 count=1978 conv=notrunc iflag=fullblock|tr "\000" "\345" >> DIG_CPM3.img
cpmcp DIG_CPM3.img osload.sys 0:
cpmcp DIG_CPM3.img cpm3.sys 0:
cpmcp DIG_CPM3.img fmthd.com 0:
cpmcp DIG_CPM3.img format.com 0:
cpmcp DIG_CPM3.img ldrgen.com 0:
cpmcp DIG_CPM3.img DF8.LDR 0:
cpmcp DIG_CPM3.img Q2020.LDR 0:
cpmcp DIG_CPM3.img dist/*.* 0:
cpmcp DIG_CPM3.img simh/*.* 0:
cpmls DIG_CPM3.img

# Create an empty Q2020 Hard disk image:
dd if=/dev/zero bs=8192 count=2048 conv=notrunc iflag=fullblock|tr "\000" "\345" >> Q2020_BOOT.img

