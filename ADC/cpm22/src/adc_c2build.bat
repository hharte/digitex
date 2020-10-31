@echo off
REM Batch file to assemble and link the track 0 loaders and
REM CP/M 2.2 with the SuperBios v2.4 for the ADC Super Six.
REM 
REM Run this batch file under Windows 10, and then run the
REM mkcpm2.sh script under Windows Subsystem for Linux
REM to genreate a SSSD 8" floppy image that can be used
REM to genreate a boot disk for the system.

echo Assembling ADC Utilities...
m80 =fmthd/l
drilink fmthd

m80 =format/l
drilink format

m80 =ldrgen/l
drilink ldrgen

REM ----------------------
REM  MAKE A TRACK 0 LOADER
REM -----------------------
REM 
REM  1. in ldrbdos, set turbo to false if CP/M 2.2 loader (loads CPM.SYS).
REM     set to true if CP/M 3.0 or Turbo Dos loader (loads  OSLOAD.SYS).
REM  2. set dskdef in ldrbios to type drive loader will be used on.
REM  3. use sbcboot if generating a floppy loader
REM     use sbcdboot if generating a loader for a hard sectored hard disk,
REM     ie. DMA5/5.
REM     use sbchboot if generating a loader of a soft sectored hard disk.
REM  4. use name of disk with 'ldr' extension in link destination file,
REM     ie. f8.ldr st419.ldr

m80 =sbcboot/l
REM Link for ADC Monitor (loader at 0000h)
drilink sbcboot=sbcboot[l0]
REM Link for Digitex Monitor (loader at C000h)
drilink dsbcboot=sbcboot[lc000]

m80 =sbchboot/l
drilink sbchboot=sbchboot[l0]

m80 =ldrbdos/l
drilink ldrbdos=ldrbdos[l100]

m80 =ldrbios/l
drilink ldrbios=ldrbios[l500]

m80 =lodrbios/l
drilink lodrbios=lodrbios[l500]

copy /b /y sbcboot.com+ldrbdos.com+ldrbios.com F8.LDR
copy /b /y dsbcboot.com+ldrbdos.com+ldrbios.com DF8.LDR
copy /b /y sbchboot.com+ldrbdos.com+lodrbios.com Q2020.LDR

echo CP/M 2.2 BDOS and CCP
rmac os2ccp
rmac os3bdos
drilink os2ccp[L0,P0]
drilink os3bdos[L0,P0]

echo CP/M 2.2 SUPRBIOS v2.4
m80 =suprbios/l
drilink suprbios[LEA00]
rem l80 /p:100,suprbios,suprbios/n/e

