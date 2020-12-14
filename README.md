# **DIGITEX 8200 S-100 Computer Ressurection**

It is possible to revive old hardware using computer simulation. This project provides materials I gathered and generated while ago when I was bringing an old Digitex 8200 computer back to life.

I could not find much documentation about this machine online.  It is an all-in-one S-100-based computer comprised of the following components:



*   [Advanced Digital Super-Six SBC](http://www.s100computers.com/Hardware%20Folder/Advanced%20Digital%20Corp/Super-Six/Super-Six.htm) with:
    *   Z80B CPU running at 6MHz.
    *   WD2793 Floppy disk controller with Shugart 851 8” floppy drive.
    *   2x RS-232 UARTs via Z80-SIO.
    *   Z80-CTC for counters/timers.
    *   Z80-DMA controller.
    *   128K DRAM.
    *   Boot ROM with monitor.
*   [Advanced Digital HDC-1001 Hard Disk Controller](http://www.s100computers.com/Hardware%20Folder/Advanced%20Digital%20Corp/HDC/HDC-1001.htm)
    *   Qume 2020 hard drive.
*   [AB Digital Design B810 RAM](https://worldradiohistory.com/hd2/IDX-Consumer/Archive-Byte-IDX/IDX/80s/80-81/Byte%201981-12-OCR-Page-0138.pdf) card (256K DRAM).
    *   Supports banking, with common RAM from 0-3FFFh.
*   [California Computer Systems 2719](https://deramp.com/downloads/mfe_archive/010-S100%20Computers%20and%20Boards/00-California%20Computer%20Systems/10-CCS%20S100%20Boards/CCS%202719%202%20Parallel%202%20Serial/) dual SIO / dual PIO card.
*   [California Computer Systems 2704](https://deramp.com/downloads/mfe_archive/010-S100%20Computers%20and%20Boards/00-California%20Computer%20Systems/10-CCS%20S100%20Boards/CCS%202704%20Terminator%20Board/) bus terminator card.

I bought this machine many years ago, but did not have a working 8-inch boot floppy disk for it.

Around 2008, I added support for this CPU card and some of the hardware to the [SIMH simulator](https://github.com/simh/simh). Using SIMH, I was able to port a customized BIOS (CBIOS) for this machine and get CP/M 2.2 booting in simulation. With the simulator, I created a bootable disk image in ImageDisk (.IMD) format. This .IMD boot image was then transferred to a real 8" floppy disk. Using this disk, I was able to boot the computer.

Recently, I decided to get the machine running again, this time using the 8-inch Qume 2020 hard drive.  To my surprise, the machine booted up OASIS 5.6 Multiuser.  I was able to use CP/M to back up the hard drive to 16 8-inch floppies, and then reassemble the pieces into a 16MB file that works using a [DREM2 hard drive emulator](https://www.drem.info/), and also in SIMH [with some modifications in this fork](https://github.com/hharte/simh/tree/digitex).

Included in the distribution are:



1. My notes in CPM22/ADCS6_Notes.txt along with CBIOS source.
2. The Digitex Monitor ROM image and disassembly (somewhat commented) in Monitor/
3. The SIMH configuration file in sim/ for CP/M 2.2 and OASIS.
4. Some OASIS disk images in OASIS/

All about ImageDisk (.IMD) with tools:



*   [http://www.classiccmp.org/dunfield/img/index.htm](http://www.classiccmp.org/dunfield/img/index.htm)

More files and Docs related to Advanced Digital Corp (ADC):



*   [http://bitsavers.trailing-edge.com/pdf/advancedDigitalCorp/](http://bitsavers.trailing-edge.com/pdf/advancedDigitalCorp/)
*   [http://bitsavers.trailing-edge.com/bits/AdvancedDigitalCorp/](http://bitsavers.trailing-edge.com/bits/AdvancedDigitalCorp/)

