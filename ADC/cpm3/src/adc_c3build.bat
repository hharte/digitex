@echo off
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

echo Track 0 Loader
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
copy /b /y sbchboot.com+ldrbdos.com+ldrbios.com Q2020.LDR

echo  CP/M 3.0 NON-BANKED MODULES
m80 =c3krnl/l
m80 =c3boot/l
m80 =c3mov/l

echo  CP/M 3.0 BANKED MODULES
m80 =c3bkrnl/l
m80 =c3bboot/l
m80 =c3bmov/l

echo  CP/M 3.0 BANKED / NON-BANKED MODULES
m80 =c3init/l
m80 =c3chr/l
m80 =c3clk/l
m80 =c3fdsk/l
m80 =c3hdsk/l
m80 =c3dtbl/l
m80 =scb/l

echo  CP/M 3.0 NON-BANKED BIOS GENERATION
drilink bios3[os]=c3krnl,c3init,c3boot,c3chr,c3clk,c3mov,c3fdsk,c3hdsk,c3dtbl,scb

echo  CP/M 3.0 LOADER GENERATION
rem hharte: Use .rel file.  Compiling from source does not work.
copy CPMLDR.IN CPMLDR.REL 
rem m80 cpmldr=cpmldrx/l
m80 =c3lkrnl/l
m80 =c3lchr/l
drilink osload.sys[l2000]=cpmldr,c3lkrnl,c3lchr,c3mov,c3fdsk,c3hdsk,c3dtbl

echo  CP/M 3.0 NON-BANKED SYSTEM GENERATION
copy C3GEN.DAT GENCPM.DAT
cpm.exe gencpm auto display
