# First, run adc_c2build.bat under Windows 10, and then
# run this script to make a CPM.SYS and cold-boot
# loaders for the ADC Super Six.

# Generate CPM.SYS
dd bs=54272 skip=1 if=os2ccp.com of=os2ccp.bin
dd bs=56320 skip=1 if=os3bdos.com of=os3bdos.bin
cat os2ccp.bin os3bdos.bin suprbios.com > cpm_new.sys
truncate -s 11008 cpm_new.sys

# Add generated ADC files to an SSSD floppy image.
cp F8.LDR ADC_CPM2_2-4.img
dd if=/dev/zero bs=128 count=1978 conv=notrunc iflag=fullblock|tr "\000" "\345" >> ADC_CPM2_2-4.img
cpmcp ADC_CPM2_2-4.img cpm.sys 0:CPM.SYS
cpmcp ADC_CPM2_2-4.img cpm_new.sys 0:CPMH.SYS
cpmcp ADC_CPM2_2-4.img fmthd.com 0:
cpmcp ADC_CPM2_2-4.img format.com 0:
cpmcp ADC_CPM2_2-4.img ldrgen.com 0:
cpmcp ADC_CPM2_2-4.img F8.LDR 0:
cpmcp ADC_CPM2_2-4.img Q2020.LDR 0:
cpmcp ADC_CPM2_2-4.img dist/*.* 0:
cpmcp ADC_CPM2_2-4.img simh/*.* 0:
cpmls ADC_CPM2_2-4.img

# Add generated Digitex files to an SSSD floppy image.
cp DF8.LDR DIGITEX_CPM2_2-4.img
dd if=/dev/zero bs=128 count=1978 conv=notrunc iflag=fullblock|tr "\000" "\345" >> DIGITEX_CPM2_2-4.img
cpmcp DIGITEX_CPM2_2-4.img cpm.sys 0:CPM.SYS
cpmcp DIGITEX_CPM2_2-4.img cpm_new.sys 0:CPMH.SYS
cpmcp DIGITEX_CPM2_2-4.img fmthd.com 0:
cpmcp DIGITEX_CPM2_2-4.img format.com 0:
cpmcp DIGITEX_CPM2_2-4.img ldrgen.com 0:
cpmcp DIGITEX_CPM2_2-4.img DF8.LDR 0:
cpmcp DIGITEX_CPM2_2-4.img Q2020.LDR 0:
cpmcp DIGITEX_CPM2_2-4.img dist/*.* 0:
cpmcp DIGITEX_CPM2_2-4.img simh/*.* 0:
cpmls DIGITEX_CPM2_2-4.img

# Create an empty Q2020 Hard disk image:
dd if=/dev/zero bs=8192 count=2048 conv=notrunc iflag=fullblock|tr "\000" "\345" >> Q2020_BOOT.img

