# OASIS for the DIGITEX 8200


## Introduction

[OASIS](https://en.wikipedia.org/wiki/THEOS#OASIS) is a multi-user operating system for Z80-based computers.  It was developed by Timothy S. Williams and has a storied history summarized in the [Wikipedia article](https://en.wikipedia.org/wiki/THEOS#OASIS), with additional information recently recovered from the [OASIS Users’ Group Archive](https://github.com/hharte/OASIS_Users_Group) newsletters.

This directory contains the OASIS 5.6 distribution for the DIGITEX 8200 computer.  It can be run in the SIMH/AltairZ80 simulator with [patches from this branch](https://github.com/hharte/simh/tree/digitex).


## Compiling SIMH/AltairZ80 with DIGITEX Patches

In Linux, do the following:


```
$ git clone https://github.com/hharte/simh.git -b digitex
$ cd simh
$ make altairz80
$ sudo cp BIN/altairz80 /usr/bin
```



## Running the Simulator

Change to the directory where you cloned the digitex repository, and run the simulator using the oasis_hd configuration file, for example:


```
$ cd ~/digitex
$ cd sim
$ altairz80 oasis_hd
OASIS multi-user version 5.6 - 736K
DIGITEX Monitor version 1.2.A -- 10/06/83

Press "H" for Help

Attempting to boot...
Press any key to abort boot.

OASIS multi-user version 5.6 - 736K

Time (HH:MM:SS)

Date (MM/DD/YY)

06:25:24 Thursday, January 31, 1985

Logon please: SYSTEM

Logon at 06:25:28, on 01/31/85.

>
```



## Learning OASIS

[THEOS / OASIS User’s Handbook](http://www.bitsavers.org/pdf/phaseOneSystems/THEOS_OASIS_Users_Handbook_1985.pdf) by Walter c. Stagner Jr., 1985

[OASIS Manuals](http://www.bitsavers.org/pdf/phaseOneSystems/oasis/) at bitsavers.org


## Additional Software

You can mount floppies from the [OASIS Users’ Group Archive](https://github.com/hharte/OASIS_Users_Group) to examine a treasure trove of OASIS software, newsletters, and technical information from 1981 through 1985.


### Example: Mounting Volume 1 of the OASIS Users’ Group

At the OASIS `>` prompt, attach the floppy device as drive A:


```
>ATTACH A FLOPPY1
```


Then press Control-E to get to the SIMH prompt, and change to the directory where the OASIS Users’ Group disk image is located:


```
sim> cd ~/OASIS_Users_Group/OASIS_Users_Group_Vol01/
sim> attach adcs60 OASIS_Users_Group_Vol01.imd
Disk write-protected because the image contains compressed sectors. Use IMDU to uncompress.
sim> g
```


Back in OASIS, mount the floppy image in drive A:


```
>MOUNT A
```


List files on the floppy disk:


```
>FILELIST :A(OWNER
Files owned by account: SYSTEM (0)

Fname--- Ftype-- Dr --Date-- Time- -Recs Blks Format- Label---

$README  FIRST1   A 03/22/82 00:15    77    4 S    75 VOL$1
ADVENTUR COMMAND  A 05/14/80 00:00    98   25 R   256 VOL$1
ADVENTUR MEMO     A 04/10/80 00:00    60    3 S    62 VOL$1
ADVENTUR WORK     A 05/14/80 00:00   200   50 D   256 VOL$1
AMAZE    BASICOBJ A 06/19/81 18:46   187    4 S    73 VOL$1
AWARI    BASICCOM A 06/04/80 12:37   131    4 SR   64 VOL$1
BAGELS   BASICOBJ A 07/21/81 16:25    72    2 S    65 VOL$1
BLKFRI2  BASICOBJ A 06/19/81 18:50   362   10 S    85 VOL$1
CHASE    BASICOBJ A 06/19/81 18:53   111    3 S    65 VOL$1
COMPILE  EXEC     A 02/29/81 17:09    45    2 S    74 VOL$1
COPYRITE NOTICE   A 05/13/82 18:33     8    1 S    65 VOL$1
DEALER   COSTINFO A 06/15/81 16:41    71    4 S    76 VOL$1
DLRADVCE ARTICLE  A 05/10/82 11:34   129    8 S    75 VOL$1
EDTORIAL ARTICLE  A 02/15/82 18:17    68    4 S    75 VOL$1
GAMES    EXEC     A 05/27/81 16:20    47    2 S    66 VOL$1
HARDDISK ARTICLE  A 09/04/81 16:39    27    2 S    75 VOL$1
HEXAPAWN BASICCOM A 07/28/80 17:15   176    5 SR   61 VOL$1
LANDER   BASICOBJ A 06/19/81 18:58   122    4 S    66 VOL$1
LANGUAGE ARTICLE  A 06/15/81 16:37   100    5 S    76 VOL$1
^
Files owned by account: SYSTEM (0)

Fname--- Ftype-- Dr --Date-- Time- -Recs Blks Format- Label---

LEM      BASICOBJ A 06/19/81 19:22   233    6 S   129 VOL$1
LOAN     BASICOBJ A 06/19/81 19:08    73    2 S    81 VOL$1
LOVE     BASICOBJ A 06/19/81 19:11    36    2 S   113 VOL$1
NEWS     LETTER1  A 06/11/82 21:25    77    4 S    70 VOL$1
OASIS    HARDWARE A 02/09/82 13:23    22    1 S    73 VOL$1
PERFRMCE ARTICLE  A 02/15/82 18:24   172    9 S    75 VOL$1
POETRY   BASICOBJ A 03/13/81 15:20   116    4 S    81 VOL$1
PURGE    EXEC     A 12/24/80 15:23    82    2 S    57 VOL$1
QUALITY  ARTICLE  A 05/10/82 11:37    54    3 S    75 VOL$1
REPEAT   EXEC     A 11/19/80 19:44    24    1 S    61 VOL$1
RUN$     EXEC     A 08/10/81 16:21    26    1 S    67 VOL$1
S$TREK   BASICOBJ A 05/08/81 18:19   211    5 S    56 VOL$1
SELECT1  EXEC     A 12/01/81 17:22    36    2 S    46 VOL$1
SERVICE  ARTICLE  A 09/04/81 16:35    56    3 S    75 VOL$1
SERVICE  INFORMTN A 06/15/81 16:49    66    4 S    76 VOL$1
SOFTWARE GUIDE    A 08/29/81 17:33    69    4 S    71 VOL$1
VOL1     EXEC     A 06/11/82 19:20   416   13 S    73 VOL$1
WUMPUS   BASICOBJ A 06/19/81 19:15   301    8 S    78 VOL$1
YAHTZEE  BASICCOM A 09/23/80 13:05   282    7 SR  117 VOL$1
38 file(s), 223 block(s).
```


Copy all of the files from the floppy disk to the hard disk:


```
>COPYFILE *.*:A = = S(NOQ
BLKFRI2.BASICOBJ:A copied to BLKFRI2.BASICOBJ:S
LEM.BASICOBJ:A copied to LEM.BASICOBJ:S
COMPILE.EXEC:A copied to COMPILE.EXEC:S
PURGE.EXEC:A copied to PURGE.EXEC:S
PERFRMCE.ARTICLE:A copied to PERFRMCE.ARTICLE:S
HARDDISK.ARTICLE:A copied to HARDDISK.ARTICLE:S
SERVICE.INFORMTN:A copied to SERVICE.INFORMTN:S
ADVENTUR.WORK:A copied to ADVENTUR.WORK:S
ADVENTUR.COMMAND:A copied to ADVENTUR.COMMAND:S
NEWS.LETTER1:A copied to NEWS.LETTER1:S
CHASE.BASICOBJ:A copied to CHASE.BASICOBJ:S
WUMPUS.BASICOBJ:A copied to WUMPUS.BASICOBJ:S
REPEAT.EXEC:A copied to REPEAT.EXEC:S
HEXAPAWN.BASICCOM:A copied to HEXAPAWN.BASICCOM:S
YAHTZEE.BASICCOM:A copied to YAHTZEE.BASICCOM:S
SOFTWARE.GUIDE:A copied to SOFTWARE.GUIDE:S
RUN$.EXEC:A copied to RUN$.EXEC:S
VOL1.EXEC:A copied to VOL1.EXEC:S
ADVENTUR.MEMO:A copied to ADVENTUR.MEMO:S
GAMES.EXEC:A copied to GAMES.EXEC:S
POETRY.BASICOBJ:A copied to POETRY.BASICOBJ:S
DLRADVCE.ARTICLE:A copied to DLRADVCE.ARTICLE:S
LOAN.BASICOBJ:A copied to LOAN.BASICOBJ:S
LANDER.BASICOBJ:A copied to LANDER.BASICOBJ:S
AMAZE.BASICOBJ:A copied to AMAZE.BASICOBJ:S
DEALER.COSTINFO:A copied to DEALER.COSTINFO:S
OASIS.HARDWARE:A copied to OASIS.HARDWARE:S
QUALITY.ARTICLE:A copied to QUALITY.ARTICLE:S
S$TREK.BASICOBJ:A copied to S$TREK.BASICOBJ:S
LANGUAGE.ARTICLE:A copied to LANGUAGE.ARTICLE:S
SERVICE.ARTICLE:A copied to SERVICE.ARTICLE:S
$README.FIRST1:A copied to $README.FIRST1:S
EDTORIAL.ARTICLE:A copied to EDTORIAL.ARTICLE:S
BAGELS.BASICOBJ:A copied to BAGELS.BASICOBJ:S
SELECT1.EXEC:A copied to SELECT1.EXEC:S
AWARI.BASICCOM:A copied to AWARI.BASICCOM:S
LOVE.BASICOBJ:A copied to LOVE.BASICOBJ:S
COPYRITE.NOTICE:A copied to COPYRITE.NOTICE:S

>

