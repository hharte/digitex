DIGITEX S-100 Computer ROM Monitor and CP/M 2.2 CBIOS
=====================================================

It is possible to revive old hardware using computer simulation.  This project provides materials I gathered and generated a while ago when I was bringing an old Digitex computer back to life.

This repository includes files related to a Digitex S-100 computer with an ADC Super-Six CPU board.  I bought this machine many years ago, but did not have the 8-inch boot floppy disk for it.

At some point, I added support for this CPU card and hardware to the SIMH simulator.  Using SIMH, I was able to port a customized BIOS (CBIOS) for this machine and get CP/M 2.2 booting in simulation.  With the simulator, I created a bootable disk image in ImageDisk (.IMD) format.  This .IMD boot image was then transferred to a real 8" floppy disk.  Using this disk, I was able to boot th computer.

Included in the distribution are:

1. My notes in CPM22/ADCS6_Notes.txt along with CBIOS source.
2. The Digitex Monitor ROM image and disassembly (somewhat commented) in Monitor/
3. The SIMH configuration file in sim/
4. Some OASIS disk images in OASIS/ (These do not work in simh due to missing support for the Z80-CTC controller in the s100_adcs6.c file.)

Source code for the simulator can be found here:

https://github.com/simh/simh/blob/master/AltairZ80/s100_adcs6.c

All about ImageDisk (.IMD) with tools:

   * http://www.classiccmp.org/dunfield/img/index.htm

More files and Docs related to Advanced Digital Corp (ADC):

   * http://bitsavers.trailing-edge.com/pdf/advancedDigitalCorp/
   * http://bitsavers.trailing-edge.com/bits/AdvancedDigitalCorp/

It has been a long time since I played with this stuff, but I figured I'd put it out there for others to mess around with either in simulation or with real hardware.

